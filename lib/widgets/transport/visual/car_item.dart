import 'package:flutter/material.dart';
import 'package:transporter/data/models/transport/car_model.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';

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
                child: ElevatedButton(
                  onPressed: onBookLater,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.marginDefault,
                    ),
                    side: const BorderSide(color: AppColors.tGreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    Strings.of(context).book_later_button_label,
                    style: Styles.bookLaterButtonGreenTextStyle,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: onRideNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tGreen,
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.marginDefault,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    Strings.of(context).ride_now_button_label,
                    style: Styles.rideNowButtonWhiteTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
