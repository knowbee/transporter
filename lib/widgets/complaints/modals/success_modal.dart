import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transporter/values/assets/complain_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/styles.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  ComplainAssets.closeIcon,
                  height: 14,
                  width: 14,
                ),
              ),
            ),
            SvgPicture.asset(
              ComplainAssets.successIcon,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 24),
            const Text(
              'Send successful',
              style: Styles.mediumLightBlackText,
            ),
            const SizedBox(height: 8),
            const Text(
              'Your complain has been send successful',
              style: Styles.regularLightGreyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Back Home',
                  style: Styles.mediumWhiteText, // Custom style
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
