import 'package:flutter/material.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';

abstract class Styles {
  static const onboardingTitleStyle = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 0.05,
  );

  static const onboardingDescriptionStyle = TextStyle(
    color: Color(0xFFA0A0A0),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const normalWhiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const normalGreenTextStyle = TextStyle(
    color: Color(0xFF008955),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const errorTextStyleRed = TextStyle(
    color: Color(0xFFE50000),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const inputLabelStyle = TextStyle(
    color: Color(0xFFD0D0D0),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const h6HeadingBlack = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const h5HeadingBlack = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 0.05,
  );

  static BoxDecoration get pinPutDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
        color: AppColors.tWhite,
        border: Border.all(color: AppColors.tLightGrey),
      );

  static BoxDecoration get selectedPinPutDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
        color: AppColors.tWhite,
        border: Border.all(color: AppColors.tLightGreen),
      );
}
