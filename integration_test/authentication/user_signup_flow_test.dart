import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/models/authentication/user.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';

import '../../test/helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  late MockUserRepository mockUserRepository;
  late MockAuthCubit mockAuthCubit;

  setUpAll(() {
    registerFallbackValue(
      User(
        name: '',
        email: '',
        phoneNumber: '',
        password: '',
        gender: '',
      ),
    );
  });

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockAuthCubit = MockAuthCubit();
  });

  group('Authentication Flow', () {
    testWidgets(
        'SignUpScreen registers new user and navigates to SetNewPasswordScreen',
        (WidgetTester tester) async {
      // Arrange
      final user = User(
        name: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '1234567890',
        gender: 'Male',
      );

      when(() => mockAuthCubit.state).thenReturn(Unauthenticated());
      when(
        () => mockAuthCubit.signUp(
          name: any(named: 'name'),
          email: any(named: 'email'),
          phoneNumber: any(named: 'phoneNumber'),
          gender: any(named: 'gender'),
        ),
      ).thenAnswer((_) async {
        // Simulate successful registration
        when(() => mockAuthCubit.state).thenReturn(Authenticated(user: user));
      });
      when(() => mockUserRepository.addUser(any()))
          .thenAnswer((_) async => Future.value());

      // Act
      await tester.pumpApp(
        BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: const SignUpScreen(),
        ),
        userRepository: mockUserRepository,
      );

      await tester.pumpAndSettle();

      // Fill in the form fields
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'john@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(2), '1234567890');

      // Select gender from dropdown
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      // Tap the sign up button
      await tester.tap(
        find.widgetWithText(TButton, Strings.current.signup_button_label),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SetNewPasswordScreen), findsOneWidget);
    });

    testWidgets('SetNewPasswordScreen sets new password successfully',
        (WidgetTester tester) async {
      // Arrange
      final user = User(
        name: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '1234567890',
        gender: 'Male',
      );

      when(() => mockAuthCubit.state).thenReturn(Authenticated(user: user));
      when(
        () => mockAuthCubit.setNewPassword(
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Future.value());

      when(() => mockUserRepository.setNewPassword(any()))
          .thenAnswer((_) async => Future.value(user));

      // Act
      await tester.pumpApp(
        BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: const SetNewPasswordScreen(),
        ),
        userRepository: mockUserRepository,
      );

      await tester.pumpAndSettle();

      // Enter new password
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'Password@123',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'Password@123',
      );
      await tester.tap(
        find.widgetWithText(TButton, Strings.current.save_button_label),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SignInScreen), findsOneWidget);
    });
  });
}
