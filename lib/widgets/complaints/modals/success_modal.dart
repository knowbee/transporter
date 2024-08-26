import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/home.dart';
import 'package:transporter/values/assets/complain_assets.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/Tbutton.dart';

abstract class _Constants {
  static const iconHeight = 100.0;
  static const iconWidth = 100.0;
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, this.message = ''});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.marginDefault),
      ),
      insetPadding: const EdgeInsets.all(Dimensions.marginLarge),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.marginMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  ComplainAssets.closeIcon,
                  height: Dimensions.iconDimensFourteen,
                  width: Dimensions.iconDimensFourteen,
                ),
              ),
            ),
            SvgPicture.asset(
              ComplainAssets.successIcon,
              height: _Constants.iconHeight,
              width: _Constants.iconWidth,
            ),
            const SizedBox(height: Dimensions.marginMedium),
            Text(
              Strings.of(context).complain_modal_title,
              style: Styles.mediumLightBlackText,
            ),
            const SizedBox(height: Dimensions.marginSmall),
            Text(
              message ?? Strings.of(context).complain_created_success_message,
              style: Styles.regularLightGreyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.marginMedium),
            SizedBox(
              width: double.infinity,
              child: TButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute<Material>(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(Dimensions.marginSmall),
                title: Strings.of(context).complain_back_home_button_label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
