import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  testWidgets('SignInScreen widget test', (WidgetTester tester) async {
    await tester.pumpApp(
      const SignInScreen(),
      userRepository: MockUserRepository(),
    );

    await tester.pumpAndSettle();

    // Verify that the email field is displayed
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the password field is displayed
    expect(
      find.widgetWithText(TextFormField, Strings.current.signin_password_label),
      findsOneWidget,
    );

    // Verify that the "Forgot Password" button is displayed
    expect(
      find.widgetWithText(
        TextButton,
        Strings.current.signin_forgot_password_label,
      ),
      findsOneWidget,
    );

    // Verify that the "Sign In" button is displayed
    expect(
      find.widgetWithText(ElevatedButton, Strings.current.signin_label),
      findsOneWidget,
    );

    // Verify that the "Sign Up" prompt is displayed
    expect(find.text(Strings.current.signup_button_label), findsOneWidget);

    // Attempt to submit without entering any data
    await tester
        .tap(find.widgetWithText(ElevatedButton, Strings.current.signin_label));
    await tester.pump();

    // Expect validation errors
    expect(
      find.text(Strings.current.signin_validation_email_or_phone),
      findsOneWidget,
    );
    expect(
      find.text(Strings.current.signin_password_validation_label),
      findsOneWidget,
    );

    // Test navigation to Forgot Password screen
    await tester.tap(
      find.widgetWithText(
        TextButton,
        Strings.current.signin_forgot_password_label,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SetNewPasswordScreen), findsOneWidget);

    // Navigate back to Sign In screen
    await tester.tap(find.text(Strings.current.header_back_label));
    await tester.pumpAndSettle();
  });
}
