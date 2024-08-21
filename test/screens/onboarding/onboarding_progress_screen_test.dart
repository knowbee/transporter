import 'package:bloc_test/bloc_test.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/onboarding/onboarding_progress_screen.dart';
import 'package:transporter/values/assets/onboarding_assets.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  testWidgets('OnboardingProgressScreen widget test',
      (WidgetTester tester) async {
    await tester.pumpApp(
      const OnboardingProgressScreen(),
      userRepository: MockUserRepository(),
    );

    // Verify that the first slide is displayed
    expect(
      find.text(
        Strings.of(tester.element(find.byType(OnboardingProgressScreen)))
            .onboarding_anywhere_heading,
      ),
      findsOneWidget,
    );
    expect(find.byType(Image), findsWidgets);

    // Verify that the "Skip" button is visible on the first slide
    expect(find.text('Skip'), findsOneWidget);

    // Swipe to the last slide
    await tester.drag(find.byType(CarouselSlider), const Offset(-500, 0));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(CarouselSlider), const Offset(-500, 0));
    await tester.pumpAndSettle();

    // Verify that the "Skip" button is not visible on the last slide
    expect(find.text('Skip'), findsNothing);

    // Verify that the correct progress icons are displayed
    expect(
      find.image(const AssetImage(OnboardingAssets.startOnboarding)),
      findsNothing,
    );
    expect(
      find.image(const AssetImage(OnboardingAssets.halfway)),
      findsNothing,
    );
    expect(
      find.image(const AssetImage(OnboardingAssets.complete)),
      findsOneWidget,
    );
  });
}
