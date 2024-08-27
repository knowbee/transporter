import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  late MockUserRepository mockUserRepository;
  late MockAuthCubit mockAuthCubit;

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockAuthCubit = MockAuthCubit();
  });
  testWidgets('SetNewPasswordScreen widget test', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<AuthCubit>.value(
        value: mockAuthCubit,
        child: const SetNewPasswordScreen(),
      ),
      userRepository: mockUserRepository,
    );
    await tester.pumpAndSettle();
    // Verify that the new password field is displayed
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the save button is displayed
    expect(
      find.byKey(const Key('new-password-save-button')),
      findsOneWidget,
    );

    // Attempt to submit without entering any data
    await tester.tap(
      find.byKey(const Key('new-password-save-button')),
    );
    await tester.pump();

    // Expect validation errors
    expect(find.text(Strings.current.new_password_validation), findsOneWidget);
    expect(
      find.text(Strings.current.confirm_password_validation),
      findsOneWidget,
    );
  });
}
