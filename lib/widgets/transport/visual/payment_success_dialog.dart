import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transporter/values/assets/complain_assets.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/Tbutton.dart';

abstract class _Constants {
  static const iconHeight = 100.0;
  static const iconWidth = 100.0;
}

class DashedDivider extends StatelessWidget {
  const DashedDivider({
    super.key,
    this.height = 1,
    this.color = Colors.black,
    this.dashWidth = 5,
    this.dashGap = 5,
  });

  final double height;
  final Color color;
  final double dashWidth;
  final double dashGap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashGap)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({
    required this.amount,
    super.key,
    this.message = '',
  });

  final String amount;
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
              TransportAssets.successIcon,
              height: _Constants.iconHeight,
              width: _Constants.iconWidth,
            ),
            const SizedBox(height: Dimensions.marginMedium),
            const Text(
              'Payment Success',
              style: Styles.mediumLightBlackText,
            ),
            const SizedBox(height: Dimensions.marginSmall),
            Text(
              message ??
                  'Your money has been successfully sent to Sergio Romasis',
              style: Styles.regularLightGreyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.marginMedium),
            const Text(
              'Amount',
              style: Styles.mediumLightBlackText,
            ),
            Text(
              '\$$amount',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Dimensions.marginSmall),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DashedDivider(
                color: AppColors.tLightGrey,
              ),
            ),
            const SizedBox(height: Dimensions.marginSmall),
            const Text(
              'How is your trip?',
              style: Styles.mediumLightBlackText,
            ),
            const SizedBox(height: Dimensions.marginSmall),
            const Text(
              'Your feedback will help us to improve your driving experience better',
              style: Styles.regularLightGreyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.marginMedium),
            SizedBox(
              width: double.infinity,
              child: TButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: 'Please Feedback',
                borderRadius: BorderRadius.circular(Dimensions.marginSmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
