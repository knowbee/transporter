import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/screens/authentication/welcome_screen.dart';
import 'package:transporter/values/assets/authentication_assets.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  testWidgets('WelcomeScreen widget test', (WidgetTester tester) async {
    await tester.pumpApp(
      const WelcomeScreen(),
      userRepository: MockUserRepository(),
    );
    // Verify that the welcome image is displayed
    expect(find.byType(Image), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                AuthenticationAssets.welcomeImage,
      ),
      findsOneWidget,
    );

    // Verify that the welcome heading and subheading are displayed
    expect(
      find.text(
        Strings.of(tester.element(find.byType(WelcomeScreen))).welcome_heading,
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        Strings.of(tester.element(find.byType(WelcomeScreen)))
            .welcome_subheading,
      ),
      findsOneWidget,
    );

    // Verify that the "Create Account" button is displayed
    final createAccountButton = find.widgetWithText(
      ElevatedButton,
      Strings.of(tester.element(find.byType(WelcomeScreen)))
          .welcome_create_account_label,
    );
    expect(createAccountButton, findsOneWidget);

    // Verify that the "Login" button is displayed
    final loginButton = find.widgetWithText(
      OutlinedButton,
      Strings.of(tester.element(find.byType(WelcomeScreen)))
          .welcome_login_label,
    );
    expect(loginButton, findsOneWidget);

    await tester.scrollUntilVisible(
      find.text(Strings.current.welcome_create_account_label),
      500, // Scroll delta, adjust as needed
    );

    // Act: Tap on the "Create an Account" button
    await tester.tap(find.text(Strings.current.welcome_create_account_label));
    await tester.pumpAndSettle();

    // Assert: Verify that SignUpScreen is pushed
    expect(find.byType(SignUpScreen), findsOneWidget);

    // Act: Return to WelcomeScreen
    await tester.tap(find.text(Strings.current.header_back_label));
    await tester.pumpAndSettle();
    // // Act: Tap on the "Sign In" button
    await tester.tap(find.text(Strings.current.welcome_login_label));
    await tester.pumpAndSettle();

    // Assert: Verify that SignInScreen is pushed
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
