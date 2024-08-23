import 'package:flutter/material.dart';
import 'package:transporter/values/assets/home_assets.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

class RequestForRentScreen extends StatelessWidget {
  const RequestForRentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Request for rent',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationSection(),
            const SizedBox(height: 16),
            _buildCarDetailsSection(),
            const SizedBox(height: 16),
            _buildPaymentMethodSection(),
            const Spacer(),
            _buildConfirmRideButton(),
          ],
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
                subtitle: '1600 Pennsylvania Ave NW, Washington, DC 20500',
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
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
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
                    Text('4.9 (531 reviews)', style: TextStyle(fontSize: 14)),
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

  Widget _buildPaymentMethodSection() {
    final paymentMethods = [
      _buildPaymentMethodItem(Icons.credit_card, '**** 8970', 'Visa'),
      _buildPaymentMethodItem(Icons.email, 'mail@address.com', 'Email'),
      _buildPaymentMethodItem(Icons.attach_money, 'Cash', ''),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select payment method',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(children: paymentMethods),
      ],
    );
  }

  Widget _buildPaymentMethodItem(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }

  Widget _buildConfirmRideButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle confirm ride action
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Confirm Ride',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
