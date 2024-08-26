import 'package:flutter/material.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';

abstract class Styles {
  static const _poppins = 'Poppins';

  static ThemeData themeData = ThemeData(
    splashFactory: InkRipple.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: AppColors.tGreen,
    canvasColor: AppColors.tGreen,
    scaffoldBackgroundColor: AppColors.tWhite,
    fontFamily: _poppins,
    cardTheme: CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static const smallBlackTitle = TextStyle(
    color: Color(0xFF414141),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
    height: 14 / 19,
  );

  static const mediumBlackTitle = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const mediumGreyParagraph = TextStyle(
    color: Color(0xFFA0A0A0),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const mediumHintText = TextStyle(
    color: Color(0xFFA5A5A5),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w400,
  );

  static const mediumRedHintText = TextStyle(
    color: AppColors.tRed,
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
    height: 0.10,
  );

  static const mediumWhiteText = TextStyle(
    color: AppColors.tWhite,
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const mediumLightGreenText = TextStyle(
    color: AppColors.tLightGreen,
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const pageTitleTextStyle = TextStyle(
    color: Color(0xFF2A2A2A),
    fontSize: 18,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const regularLightBlackSubheading = TextStyle(
    color: Color(0xFF414141),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w400,
  );

  static const regularGreyParagraph = TextStyle(
    color: Color(0xFFA0A0A0),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.normal,
  );

  static const normalGreenTextStyle = TextStyle(
    color: Color(0xFF008955),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const errorTextStyleRed = TextStyle(
    color: Color(0xFFE50000),
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const smallParagraphBlack = TextStyle(
    color: Color(0xFFB8B8B8),
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const smallSubheadingBlack = TextStyle(
    color: Color(0xFFB8B8B8),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const smallParagraphLightGreen = TextStyle(
    color: AppColors.tLightGreen,
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const smallParagraphGrey = TextStyle(
    color: AppColors.tGrey,
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const inputLabelStyle = TextStyle(
    color: Color(0xFFD0D0D0),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const h6HeadingBlack = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const h5HeadingBlack = TextStyle(
    color: Color(0xFF414141),
    fontSize: 24,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
    height: 0.05,
  );

  static const orSeparatorTextStyle = TextStyle(
    color: Color(0xFFB8B8B8),
    fontFamily: _poppins,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const countryCodeTextStyle = TextStyle(
    color: Color(0xFF262626),
    fontSize: 16,
    fontFamily: _poppins,
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

  static const regularBlackText = TextStyle(
    color: Color(0xFF414141),
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const headingLightBlackText = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 24,
    fontFamily: _poppins,
    fontWeight: FontWeight.w600,
  );

  static const mediumBlackLabel = TextStyle(
    color: Color(0xFF414141),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
    height: 0.09,
  );

  static const mediumBlackText = TextStyle(
    color: Color(0xFF414141),
    fontSize: 18,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const smallLightBlackText = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const mediumLightBlackText = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 22,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const regularLightGreyText = TextStyle(
    color: Color(0xFF898989),
    fontSize: 12,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const textAreaHintStyle = TextStyle(
    color: Color(0xFFD0D0D0),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w400,
    height: 2,
  );

  static const vSmallBlackText = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 14,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const modalHeadingStyle = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 20,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const specificationHeadingStyle = TextStyle(
    color: Color(0xFF5A5A5A),
    fontSize: 18,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
  );

  static const rideNowButtonWhiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const bookLaterButtonGreenTextStyle = TextStyle(
    color: AppColors.tGreen,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
