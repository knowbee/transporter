import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/transport/select_transport_screen.dart';
import 'package:transporter/values/assets/home_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

class AddressConfirmationBottomSheet extends StatelessWidget {
  const AddressConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.marginDefault),
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
          const SizedBox(height: Dimensions.marginDefault),
          _buildAddressConfirmationSection(),
          const SizedBox(height: 8),
          _buildConfirmButton(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: Dimensions.marginSmall),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(thickness: 4, color: AppColors.lightBlack),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.marginDefault),
            Text(
              Strings.current.address_selection_header,
              style: Styles.modalHeadingStyle,
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

  Widget _buildAddressConfirmationSection() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _buildAddressIcon(HomeAssets.startLocation),
                _buildDottedLine(),
                _buildAddressIcon(HomeAssets.endLocation),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAddressItem(
                    title: 'Current location',
                    address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
                  ),
                  const SizedBox(height: Dimensions.marginDefault),
                  _buildAddressItem(
                    title: 'Office',
                    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                    distance: '1.1km',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressIcon(String iconPath) {
    return Image.asset(
      iconPath,
      width: Dimensions.iconDimensTwentyFour,
      height: Dimensions.iconDimensTwentyFour,
    );
  }

  Widget _buildDottedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.marginSmall),
      child: Column(
        children: List.generate(8, (index) => _buildDot()),
      ),
    );
  }

  Widget _buildDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: 2,
        height: 2,
        decoration: const BoxDecoration(
          color: AppColors.tLightGreen,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildAddressItem({
    required String title,
    required String address,
    String? distance,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.smallLightBlackText,
            ),
            const SizedBox(height: 4),
            Text(
              address,
              style: Styles.smallParagraphBlack,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        if (distance != null) ...[
          const SizedBox(height: 4),
          Text(distance, style: Styles.vSmallBlackText),
        ],
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.marginDefault),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.tGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute<Material>(
              builder: (context) => const TransportSelectionScreen(),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: Dimensions.marginDefault),
          child: Text(
            Strings.current.confirm_button_label,
            style: Styles.mediumWhiteText,
          ),
        ),
      ),
    );
  }
}
