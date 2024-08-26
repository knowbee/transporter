import 'package:flutter/material.dart';
import 'package:transporter/values/assets/payment_assets.dart';
import 'package:transporter/values/assets/profile_assets.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/widgets/common/input/Tbutton.dart';
import 'package:transporter/widgets/transport/visual/payment_success_dialog.dart';

class ConfirmRideBottomSheet extends StatelessWidget {
  const ConfirmRideBottomSheet({super.key});

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
          const SizedBox(height: Dimensions.marginDefault),
          _buildDriverInfo(),
          const Divider(color: AppColors.tLightGrey, thickness: 1),
          _buildPaymentSection(),
          const SizedBox(height: 16),
          _buildPayButton(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Your driver is coming in 3:35',
                style: TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
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

  Widget _buildDriverInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            child: Image.asset(
              ProfileAssets.avatar, // Replace with actual driver image asset
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sergio Ramasis',
                  style: TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.black, size: 12),
                    Text(
                      '800m (5mins away)',
                      style: TextStyle(
                        color: AppColors.tGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    SizedBox(width: 4),
                    Text(
                      '4.9',
                      style: TextStyle(
                        color: AppColors.tGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(531 reviews)',
                      style: TextStyle(
                        color: AppColors.tGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            TransportAssets.mustang, // Replace with actual car image asset
            width: 80,
            height: 50,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Text(
                'Payment method',
                style: TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                r'$220.00',
                style: TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.tGreen),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              color: AppColors.tLightGreen.withOpacity(0.1),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  child: Image.asset(
                    PaymentAssets.visa,
                    width: 50,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 8970',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Expires: 12/26',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.tLightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TButton(
        onPressed: () {
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return const PaymentSuccessDialog(
                amount: '220',
              );
            },
          );
        },
        title: 'Pay',
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
