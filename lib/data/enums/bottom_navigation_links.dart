import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/navigation_assets.dart';
import 'package:transporter/values/colors.dart';

enum BottomNavigationLinks { home, favourite, wallet, offer, profile }

extension BottomNavigationLinksContent on BottomNavigationLinks {
  String get label {
    switch (this) {
      case BottomNavigationLinks.home:
        return Strings.current.bottom_navigation_home_label;
      case BottomNavigationLinks.favourite:
        return Strings.current.bottom_navigation_fav_label;
      case BottomNavigationLinks.wallet:
        return Strings.current.bottom_navigation_wallet_label;
      case BottomNavigationLinks.offer:
        return Strings.current.bottom_navigation_offer_label;
      case BottomNavigationLinks.profile:
        return Strings.current.bottom_navigation_profile_label;
    }
  }

  Widget get content {
    switch (this) {
      case BottomNavigationLinks.home:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.bottom_navigation_home_label),
          ),
        );
      case BottomNavigationLinks.favourite:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.bottom_navigation_fav_label),
          ),
        );
      case BottomNavigationLinks.wallet:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.bottom_navigation_wallet_label),
          ),
        );
      case BottomNavigationLinks.offer:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.bottom_navigation_offer_label),
          ),
        );
      case BottomNavigationLinks.profile:
        return Scaffold(
          body: Center(
            child: Text(Strings.current.bottom_navigation_profile_label),
          ),
        );
    }
  }

  String? get icon {
    switch (this) {
      case BottomNavigationLinks.home:
        return NavigationAssets.home;
      case BottomNavigationLinks.favourite:
        return NavigationAssets.favourite;
      case BottomNavigationLinks.wallet:
        return null;
      case BottomNavigationLinks.offer:
        return NavigationAssets.offer;
      case BottomNavigationLinks.profile:
        return NavigationAssets.profile;
    }
  }

  Color get selectedIconColor => AppColors.tGreen;
  Color get unselectedIconColor => AppColors.tGrey;
}
