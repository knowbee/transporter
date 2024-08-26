import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/home.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';
import 'package:transporter/widgets/transport/visual/confirm_ride_modal_sheet.dart';

abstract class _Constants {
  static const iconHeight = 124.0;
  static const iconWidth = 124.0;
}

class ConfirmRideScreen extends StatelessWidget {
  const ConfirmRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: SvgPicture.asset(
                      TransportAssets.successIcon,
                      height: _Constants.iconHeight,
                      width: _Constants.iconWidth,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Thank you',
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your booking has been placed\nsent to Md. Sharif Ahmed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Material>(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  showAddressSelectionBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppColors.tGreen,
                ),
                child: Text(
                  Strings.current.confirm_ride,
                  style: Styles.mediumWhiteText,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void showAddressSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimensions.radiusXLarge),
        ),
      ),
      builder: (context) => const ConfirmRideBottomSheet(),
    );
  }
}
