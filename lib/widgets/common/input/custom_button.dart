import 'package:flutter/material.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

enum TButtonType { filled, outlined }

class TButton extends StatelessWidget {
  const TButton({
    required this.onPressed,
    required this.title,
    super.key,
    this.backgroundColor = AppColors.tGreen,
    this.outlineColor = Colors.green,
    this.textStyle = Styles.mediumWhiteText,
    this.isEnabled = true,
    this.isLoading = false,
    this.buttonType = TButtonType.filled,
    this.padding =
        const EdgeInsets.symmetric(vertical: Dimensions.marginDefault),
    this.borderRadius =
        const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
  });

  final VoidCallback? onPressed;
  final String title;
  final Color backgroundColor;
  final Color outlineColor;
  final TextStyle textStyle;
  final bool isEnabled;
  final bool isLoading;
  final TButtonType buttonType;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final buttonContent = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          )
        : Text(
            title,
            style: textStyle,
          );

    if (buttonType == TButtonType.outlined) {
      return OutlinedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        style: OutlinedButton.styleFrom(
          padding: padding,
          side: BorderSide(color: isEnabled ? outlineColor : Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: buttonContent,
      );
    } else {
      return ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: isEnabled ? backgroundColor : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: buttonContent,
      );
    }
  }
}
