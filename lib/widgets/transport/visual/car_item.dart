import 'package:flutter/material.dart';
import 'package:transporter/data/models/transport/car_model.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    required this.car,
    required this.onBookLater,
    required this.onRideNow,
    super.key,
  });
  final Car car;
  final VoidCallback onBookLater;
  final VoidCallback onRideNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.marginDefault),
      padding: const EdgeInsets.all(Dimensions.marginDefault),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.tLightGreen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: const TextStyle(
                        fontSize: Dimensions.marginEigtheen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      car.details,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.tLightGrey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: Dimensions.marginDefault,
                          color: AppColors.tBlack,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${car.distance} (${car.time})',
                          style: const TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Dimensions.marginDefault),
              Image.asset(car.imagePath, height: 80),
            ],
          ),
          const SizedBox(height: Dimensions.marginDefault),
          Row(
            children: [
              Expanded(
                child: TButton(
                  onPressed: onBookLater,
                  title: Strings.of(context).book_later_button_label,
                  outlineColor: AppColors.tGreen,
                  textStyle: Styles.bookLaterButtonGreenTextStyle,
                  borderRadius: BorderRadius.circular(8),
                  buttonType: TButtonType.outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TButton(
                  onPressed: onRideNow,
                  title: Strings.of(context).ride_now_button_label,
                  textStyle: Styles.rideNowButtonWhiteTextStyle,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
