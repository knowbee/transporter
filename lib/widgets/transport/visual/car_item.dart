import 'package:flutter/material.dart';
import 'package:transporter/data/models/transport/car_model.dart';
import 'package:transporter/values/colors.dart';

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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
                        fontSize: 18,
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
                        const Icon(Icons.location_on,
                            size: 16, color: AppColors.tGreen),
                        const SizedBox(width: 4),
                        Text(
                          '${car.distance} (${car.time})',
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.tGreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Image.asset(car.imagePath, height: 80),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onBookLater,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: AppColors.tGreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Book later',
                    style: TextStyle(color: AppColors.tGreen),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: onRideNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Ride Now',
                    style: TextStyle(color: Colors.white),
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
