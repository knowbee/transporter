import 'package:flutter/material.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';

abstract class Styles {
  static const mediumBlackTitle = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const mediumGreyParagraph = TextStyle(
    color: Color(0xFFA0A0A0),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const mediumHintText = TextStyle(
    color: Color(0xFFA5A5A5),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const mediumRedHintText = TextStyle(
    color: AppColors.tRed,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 0.10,
  );

  static const mediumWhiteText = TextStyle(
    color: AppColors.tWhite,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const mediumLightGreenText = TextStyle(
    color: AppColors.tLightGreen,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const regularLightBlackSubheading = TextStyle(
    color: Color(0xFF414141),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const regularGreyParagraph = TextStyle(
    color: Color(0xFFA0A0A0),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    height: 16 / 24,
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

  static const smallParagraphBlack = TextStyle(
    color: Color(0xFFB8B8B8),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const smallParagraphLightGreen = TextStyle(
    color: AppColors.tLightGreen,
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

  static const orSeparatorTextStyle = TextStyle(
    color: Color(0xFFB8B8B8),
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const countryCodeTextStyle = TextStyle(
    color: Color(0xFF262626),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
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
