import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/home_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

class AddressSelectionBottomSheet extends StatelessWidget {
  const AddressSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          const Divider(color: AppColors.tLightGrey, thickness: 1),
          _buildAddressInputs(),
          const Divider(color: AppColors.tLightGrey, thickness: 1),
          _buildRecentPlacesSection(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(thickness: 4, color: AppColors.lightBlack),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Select address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: AppColors.lightBlack,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddressInputs() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInputField(
            icon: HomeAssets.locationIcon,
            hintText: Strings.current.from_label,
          ),
          const SizedBox(height: 16),
          _buildInputField(
            icon: HomeAssets.mapPinIcon,
            hintText: Strings.current.from_label,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String icon,
    required String hintText,
    IconData? suffixIcon,
    bool obscureText = false,
    TextEditingController? controller,
    Function()? onSuffixIconPressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.smallLightBlackText,
        prefixIcon: Image.asset(
          icon,
          width: 12,
          height: 12,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: Colors.grey),
                onPressed: onSuffixIconPressed,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGreen),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
      ),
    );
  }

  Widget _buildRecentPlacesSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent places',
            style: Styles.smallLightBlackText,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                _buildRecentPlaceItem(
                  title: 'Office',
                  address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
                  distance: '2.7km',
                ),
                _buildRecentPlaceItem(
                  title: 'Coffee shop',
                  address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                  distance: '1.1km',
                ),
                _buildRecentPlaceItem(
                  title: 'Shopping center',
                  address: '4140 Parker Rd. Allentown, New Mexico 31134',
                  distance: '4.9km',
                ),
                _buildRecentPlaceItem(
                  title: 'Shopping mall',
                  address: '4140 Parker Rd. Allentown, New Mexico 31134',
                  distance: '4.0km',
                ),
                // Add more items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentPlaceItem({
    required String title,
    required String address,
    required String distance,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            HomeAssets.mapIcon,
            width: Dimensions.iconDimensTwentyFour,
            height: Dimensions.iconDimensTwentyFour,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.smallLightBlackText,
                ),
                Text(
                  address,
                  style: Styles.smallParagraphBlack,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(distance, style: Styles.vSmallBlackText),
        ],
      ),
    );
  }
}
