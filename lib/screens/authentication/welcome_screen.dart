import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/values/assets/authentication_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/authentication/welcome';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.tWhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
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
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        Strings.of(context).welcome_subheading,
                        style: Styles.normalWhiteTextStyle.copyWith(
                          color: AppColors.tGrey,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<Material>(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.marginDefault,
                              ),
                              backgroundColor: AppColors.tGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall,
                                ),
                              ),
                            ),
                            child: Text(
                              Strings.of(context).welcome_create_account_label,
                              style: Styles.normalWhiteTextStyle,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<Material>(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.marginDefault,
                              ),
                              side: const BorderSide(color: Colors.green),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall,
                                ),
                              ),
                            ),
                            child: Text(
                              Strings.of(context).welcome_login_label,
                              style: Styles.normalGreenTextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.06),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
