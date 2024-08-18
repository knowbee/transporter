import 'package:flutter/material.dart';
import 'package:transporter/l10n/l10n.dart';
import 'package:transporter/screens/onboarding/onboarding_progress_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const OnboardingProgressScreen(),
    );
  }
}
