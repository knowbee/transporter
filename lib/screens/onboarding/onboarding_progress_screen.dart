// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/verify_otp_screen.dart';
import 'package:transporter/screens/authentication/welcome_screen.dart';
import 'package:transporter/screens/home.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/assets/onboarding_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/durations.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/onboarding/visual/transporter_progress_header.dart';

abstract class _Constants {
  static const progressIconHeight = 86.0;
}

class OnboardingProgressScreen extends StatelessWidget {
  const OnboardingProgressScreen({super.key});
  static const routeName = '/onboarding/welcome';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(userRepository: context.read<UserRepository>())
        ..checkAuthState(),
      child: const OnboardingProgressView(),
    );
  }
}

class OnboardingProgressView extends StatelessWidget {
  const OnboardingProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildEmptyAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.tWhite,
      body: const ResponsiveLayout(
        child: OnboardingProgressCarousel(),
      ),
    );
  }

  PreferredSizeWidget _buildEmptyAppBar() => PreferredSize(
        preferredSize: Size.zero,
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: Container(),
        ),
      );
}

class OnboardingProgressCarousel extends StatefulWidget {
  const OnboardingProgressCarousel({super.key});

  @override
  _OnboardingProgressCarousel createState() => _OnboardingProgressCarousel();
}

class _OnboardingProgressCarousel extends State<OnboardingProgressCarousel> {
  int _current = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  late Image _anywhereImage;
  late Image _anytimeImage;
  late Image _bookYourCarImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(_anywhereImage.image, context);
    precacheImage(_anytimeImage.image, context);
    precacheImage(_bookYourCarImage.image, context);
  }

  @override
  void initState() {
    super.initState();

    _anywhereImage = Image.asset(
      OnboardingAssets.anywhereImage,
      width: double.infinity,
    );
    _anytimeImage = Image.asset(
      OnboardingAssets.anytimeImage,
      width: double.infinity,
    );
    _bookYourCarImage = Image.asset(
      OnboardingAssets.bookYourCarImage,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          if (state.user.password == null || state.user.password == '') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SetNewPasswordScreen(),
              ),
            );
          } else if (state.user.isVerified == false) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const VerificationScreen(),
              ),
            );
          } else if (state.user.isLoggedIn == false) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SignInScreen(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => HomePage(
                  user: state.user,
                ),
              ),
            );
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TProgressHeader(
            showSkip: _current < 2,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Material>(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
          ),
          Expanded(
            child: _buildBody(),
          ),
          _buildFooter(index: _current),
        ],
      ),
    );
  }

  Widget _buildBody() => SizedBox(
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlayInterval: AppDurations.carouselInterval,
            scrollPhysics: const ClampingScrollPhysics(),
            onPageChanged: (index, reason) => setState(
              () => _current = index,
            ),
          ),
          items: [
            _firstSlide(),
            _secondSlide(),
            _thirdSlide(),
          ],
        ),
      );

  Widget _buildFooter({required int index}) => Container(
        color: AppColors.tWhite,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: Dimensions.marginLarge,
          right: Dimensions.marginLarge,
          bottom: Dimensions.marginDefault,
        ),
        child: SafeArea(
          top: false,
          maintainBottomViewPadding: true,
          child: GestureDetector(
            onTap: () {
              if (_current < 2) {
                _carouselController.nextPage();
              } else if (_current == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute<Material>(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              }
              setState(
                () => _current = (_current + 1) % 3,
              );
            },
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  height: _Constants.progressIconHeight,
                  index == 0
                      ? OnboardingAssets.startOnboarding
                      : index == 1
                          ? OnboardingAssets.halfway
                          : OnboardingAssets.complete,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _firstSlide() => _slideTemplate(
        title: Strings.of(context).onboarding_anywhere_heading,
        asset: _anywhereImage,
        description: Strings.of(context).onboarding_anywhere_description,
        topInset: Dimensions.marginLarge,
        leftInset: Dimensions.marginLarge,
        rightInset: Dimensions.marginLarge,
      );

  Widget _secondSlide() => _slideTemplate(
        title: Strings.of(context).onboarding_anytime_heading,
        asset: _anytimeImage,
        description: Strings.of(context).onboarding_anytime_description,
        topInset: Dimensions.marginLarge,
        leftInset: Dimensions.marginLarge,
        rightInset: Dimensions.marginLarge,
      );

  Widget _thirdSlide() => _slideTemplate(
        title: Strings.of(context).onboarding_book_car_heading,
        asset: _bookYourCarImage,
        description: Strings.of(context).onboarding_book_car_description,
        topInset: Dimensions.marginLarge,
        leftInset: Dimensions.marginLarge,
        rightInset: Dimensions.marginLarge,
      );

  Widget _slideTemplate({
    required Widget asset,
    required String description,
    required String title,
    double? topInset,
    double? leftInset,
    double? rightInset,
  }) =>
      Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              asset,
              const SizedBox(
                height: 40,
              ),
              Flexible(
                child: Text(
                  title,
                  style: Styles.mediumBlackTitle,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Text(
                  description,
                  style: Styles.mediumGreyParagraph,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      );
}
