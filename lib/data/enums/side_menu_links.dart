import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/home/complain_screen.dart';
import 'package:transporter/values/assets/drawer_assets.dart';
import 'package:transporter/values/dimensions.dart';

enum SideMenuLinks {
  history,
  complain,
  referral,
  about,
  settings,
  support,
  logout
}

extension SideMenuLinksContent on SideMenuLinks {
  String get label {
    switch (this) {
      case SideMenuLinks.history:
        return Strings.current.menu_history_label;
      case SideMenuLinks.complain:
        return Strings.current.menu_complain_label;
      case SideMenuLinks.referral:
        return Strings.current.menu_referral_label;
      case SideMenuLinks.about:
        return Strings.current.menu_about_label;
      case SideMenuLinks.settings:
        return Strings.current.menu_settings_label;
      case SideMenuLinks.support:
        return Strings.current.menu_help_label;
      case SideMenuLinks.logout:
        return Strings.current.menu_logout_label;
    }
  }

  Widget get content {
    switch (this) {
      case SideMenuLinks.history:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_history_label),
          ),
        );
      case SideMenuLinks.complain:
        return const ComplainScreen();
      case SideMenuLinks.referral:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_referral_label),
          ),
        );
      case SideMenuLinks.about:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_about_label),
          ),
        );
      case SideMenuLinks.settings:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_settings_label),
          ),
        );
      case SideMenuLinks.support:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_help_label),
          ),
        );
      case SideMenuLinks.logout:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.menu_logout_label),
          ),
        );
    }
  }

  Widget get icon {
    switch (this) {
      case SideMenuLinks.history:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.historyIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.complain:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.complainIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.referral:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.referralIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.about:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.aboutUsIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.settings:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.settingsIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.support:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.supportIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
      case SideMenuLinks.logout:
        return _buildMargin(
          SvgPicture.asset(
            MenuDrawerAssets.logoutIcon,
            width: Dimensions.iconDimensSixteen,
          ),
        );
    }
  }

  Widget _buildMargin(Widget icon) => Container(
        margin: EdgeInsets.zero,
        child: icon,
      );
}
