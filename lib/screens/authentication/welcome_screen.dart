import 'package:flutter/material.dart';
import 'package:transporter/l10n/l10n.dart';
import 'package:transporter/values/assets/authentication_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.tWhite,
      body: Padding(
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
              l10n.welcome_heading,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              l10n.welcome_subheading,
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
                    // Handle account creation
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.marginDefault,
                    ),
                    backgroundColor: AppColors.tGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSmall),
                    ),
                  ),
                  child: Text(
                    l10n.welcome_create_account_label,
                    style: Styles.normalWhiteTextStyle,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                OutlinedButton(
                  onPressed: () {
                    // Handle log in
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.marginDefault,
                    ),
                    side: const BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSmall),
                    ),
                  ),
                  child: Text(
                    l10n.welcome_login_label,
                    style: Styles.normalGreenTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.06),
          ],
        ),
      ),
    );
  }
}
