import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transporter/l10n/l10n.dart';
import 'package:transporter/screens/home.dart';

void main() {
  testWidgets('HomePage has a title and greeting text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
    expect(
      find.text('Transporter'),
      findsOneWidget,
    );
    expect(find.text('Hi'), findsOneWidget);
  });
}
