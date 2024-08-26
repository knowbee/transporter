import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/assets/authentication_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/authentication/welcome';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.tWhite,
      body: ResponsiveLayout(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.marginDefault,
          ),
          child: Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.asset(
                  AuthenticationAssets.welcomeImage,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                Strings.of(context).welcome_heading,
                style: Styles.mediumBlackTitle,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                Strings.of(context).welcome_subheading,
                style: Styles.regularGreyParagraph,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Material>(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    title: Strings.of(context).welcome_create_account_label,
                  ),
                  SizedBox(height: size.height * 0.02),
                  TButton(
                    backgroundColor: AppColors.tWhite,
                    buttonType: TButtonType.outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Material>(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    title: Strings.of(context).welcome_login_label,
                    textStyle: Styles.mediumLightGreenText,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
