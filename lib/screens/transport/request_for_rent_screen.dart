import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/transport/confirm_ride_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/assets/home_assets.dart';
import 'package:transporter/values/assets/payment_assets.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/Tbutton.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class RequestForRentScreen extends StatefulWidget {
  const RequestForRentScreen({super.key});

  @override
  State<RequestForRentScreen> createState() => _RequestForRentScreenState();
}

class _RequestForRentScreenState extends State<RequestForRentScreen> {
  int selectedPaymentMethod = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
          title: Strings.of(context).request_for_rent_screen_title,
          hasTitle: true,
        ),
      ),
      body: ResponsiveLayout(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationSection(),
              const SizedBox(height: 30),
              _buildCarDetailsSection(),
              const SizedBox(height: 30),
              _buildChargeSection(),
              const SizedBox(height: 30),
              _buildPaymentMethodSection(),
              const SizedBox(height: 30),
              const Spacer(),
              _buildConfirmRideButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Row(
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
              _buildLocationRow(
                icon: Icons.location_on,
                title: 'Current location',
                subtitle: '200 Boston St. New York 66554',
              ),
              const SizedBox(height: 8),
              _buildLocationRow(
                icon: Icons.location_on,
                title: 'Office',
                subtitle: '1600 Pennsylvania Ave DC 20500 ',
                trailing: const Text('1.8km'),
              ),
            ],
          ),
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
        children: List.generate(6, (index) => _buildDot()),
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

  Widget _buildLocationRow({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF5A5A5A),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Styles.smallParagraphBlack,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildCarDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.tLighterGreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.tGreen),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mustang Shelby GT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '4.9 (531 reviews)',
                      style: Styles.smallSubheadingBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            TransportAssets.mustang,
            width: 100,
            height: 60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildChargeSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Charge',
          style: Styles.specificationHeadingStyle,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mustang/per hours',
              style: Styles.vSmallBlackText,
            ),
            Text(
              r'$200',
              style: Styles.vSmallBlackText,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vat(5%)',
              style: Styles.vSmallBlackText,
            ),
            Text(
              r'$20',
              style: Styles.vSmallBlackText,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    final paymentMethods = [
      _buildPaymentMethodItem(
        selectedPaymentMethod == 0,
        PaymentAssets.visa,
        '**** **** **** 8970',
        'Expires: 12/26',
        index: 0,
      ),
      _buildPaymentMethodItem(
        selectedPaymentMethod == 1,
        PaymentAssets.mastercard,
        '**** **** **** 8970',
        'Expires: 12/26',
        index: 1,
      ),
      _buildPaymentMethodItem(
        selectedPaymentMethod == 2,
        PaymentAssets.paypal,
        'mailaddress@mail.com',
        'Expires: 12/26',
        index: 2,
      ),
      _buildPaymentMethodItem(
        selectedPaymentMethod == 3,
        PaymentAssets.cash,
        'Cash',
        'Expires: 12/26',
        index: 3,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select payment method',
          style: Styles.specificationHeadingStyle,
        ),
        const SizedBox(height: 16),
        Column(children: paymentMethods),
      ],
    );
  }

  Widget _buildPaymentMethodItem(
    bool isSelected,
    String icon,
    String title,
    String subtitle, {
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: AppColors.tGreen)
              : Border.all(color: AppColors.tLightGreen.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: isSelected
              ? AppColors.tLightGreen.withOpacity(0.1)
              : AppColors.tLighterGreen.withOpacity(0.1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              child: Image.asset(
                icon,
                width: 45,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ).copyWith(
                      color: isSelected
                          ? AppColors.lightBlack
                          : AppColors.lightBlack.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyIconColor,
                    ).copyWith(
                      color: isSelected
                          ? AppColors.lightBlack
                          : AppColors.lightBlack.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmRideButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<Material>(
              builder: (context) => const ConfirmRideScreen(),
            ),
          );
        },
        padding: const EdgeInsets.all(18),
        borderRadius: BorderRadius.circular(12),
        title: 'Confirm Ride',
      ),
    );
  }
}
