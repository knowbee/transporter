import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  testWidgets('SignUpScreen widget test', (WidgetTester tester) async {
    await tester.pumpApp(
      const SignUpScreen(),
      userRepository: MockUserRepository(),
    );

    // Verify that the header title is displayed
    expect(
      find.text(
        Strings.of(tester.element(find.byType(SignUpScreen))).header_back_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Name" field is displayed
    expect(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_name_field_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Email" field is displayed
    expect(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_email_field_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Phone" field is displayed
    expect(
      find.text('+880'),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_phone_field_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Gender" field is displayed
    expect(
      find.text(
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_gender_field_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Sign Up" button is displayed
    final signUpButton = find.widgetWithText(
      ElevatedButton,
      Strings.of(tester.element(find.byKey(const Key('signup_button'))))
          .signup_button_label,
    );
    expect(signUpButton, findsOneWidget);

    // Act: Fill out the form fields
    await tester.enterText(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_name_field_label,
      ),
      'Test User',
    );
    await tester.enterText(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_email_field_label,
      ),
      'testuser@example.com',
    );
    await tester.enterText(
      find.widgetWithText(
        TextFormField,
        Strings.of(tester.element(find.byType(SignUpScreen)))
            .signup_phone_field_label,
      ),
      '1234567890',
    );
  });
}
