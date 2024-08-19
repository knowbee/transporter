import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/home.dart';

void main() {
  testWidgets('HomePage has a title and greeting text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        home: const HomePage(),
      ),
    );
    expect(
      find.text('Transporter'),
      findsOneWidget,
    );
    expect(find.text('Hi'), findsOneWidget);
  });
}
