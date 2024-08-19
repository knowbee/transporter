import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/verify_otp_screen.dart';

void main() {
  testWidgets('VerificationScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        home: const VerificationScreen(),
      ),
    );

    // Verify that the heading is displayed
    expect(find.text(Strings.current.verify_phone_heading), findsOneWidget);

    // Verify that the subheading is displayed
    expect(find.text(Strings.current.verify_phone_subheading), findsOneWidget);

    // Verify that the PIN input field is displayed
    expect(find.byType(PinPut), findsOneWidget);

    // Verify that the verification button is displayed
    expect(
      find.widgetWithText(ElevatedButton, Strings.current.verify_button_label),
      findsOneWidget,
    );

    // Test PIN input
    await tester.enterText(find.byType(PinPut), '12345');
    expect(find.text('12345'), findsOneWidget);

    // Tap the verification button
    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        Strings.current.verify_button_label,
      ),
    );
    await tester.pumpAndSettle();

    // Verify that the screen navigates to SetNewPasswordScreen after successful verification
    expect(find.byType(SetNewPasswordScreen), findsOneWidget);
  });
}
