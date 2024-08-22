import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:transporter/data/repositories/complain_repository.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/onboarding/onboarding_progress_screen.dart';
import 'package:transporter/values/styles.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    required ComplaintRepository complaintRepository,
    super.key,
  })  : _userRepository = userRepository,
        _complaintRepository = complaintRepository;
  final UserRepository _userRepository;
  final ComplaintRepository _complaintRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
      ),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _complaintRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData,
      localizationsDelegates: const [
        Strings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Strings.delegate.supportedLocales,
      home: const OnboardingProgressScreen(),
    );
  }
}
