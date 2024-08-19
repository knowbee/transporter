import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/durations.dart';
import 'package:transporter/values/styles.dart';

class TErrorText extends StatelessWidget {
  const TErrorText({
    super.key,
    this.errorText,
    this.textColor,
    this.errorTextStyle,
  });
  final String? errorText;
  final Color? textColor;
  final TextStyle? errorTextStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppDurations.quick,
      child: AnimatedSwitcher(
        duration: AppDurations.quick,
        child: errorText != null
            ? Padding(
                key: ValueKey(errorText),
                padding: const EdgeInsets.only(
                  top: Dimensions.marginVerySmall,
                  left: Dimensions.marginDefault,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorText!,
                    textAlign: TextAlign.start,
                    style: errorTextStyle ??
                        Styles.errorTextStyleRed.copyWith(color: textColor),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
