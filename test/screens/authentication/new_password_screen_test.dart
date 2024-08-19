import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';

void main() {
  testWidgets('SetNewPasswordScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        home: const SetNewPasswordScreen(),
      ),
    );

    // Verify that the new password field is displayed
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the save button is displayed
    expect(
      find.widgetWithText(ElevatedButton, Strings.current.save_button_label),
      findsOneWidget,
    );

    // Attempt to submit without entering any data
    await tester.tap(
      find.widgetWithText(ElevatedButton, Strings.current.save_button_label),
    );
    await tester.pump();

    // Expect validation errors
    expect(find.text(Strings.current.new_password_validation), findsOneWidget);
    expect(
      find.text(Strings.current.confirm_password_validation),
      findsOneWidget,
    );

    // Test successful password entry
    await tester.enterText(
      find.widgetWithText(TextFormField, Strings.current.new_password_label),
      'newpassword123',
    );
    await tester.enterText(
      find.widgetWithText(
        TextFormField,
        Strings.current.confirm_password_label,
      ),
      'newpassword123',
    );
    await tester.tap(
      find.widgetWithText(ElevatedButton, Strings.current.save_button_label),
    );
    await tester.pumpAndSettle();

    // Verify that the screen navigates to SignInScreen after successful save
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
