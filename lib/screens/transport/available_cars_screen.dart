import 'package:flutter/material.dart';
import 'package:transporter/data/models/transport/car_model.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/transport/car_details_screen.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';
import 'package:transporter/widgets/transport/visual/car_item.dart';

class AvailableCarsScreen extends StatelessWidget {
  AvailableCarsScreen({super.key});
  final List<Car> availableCars = [
    Car(
      name: 'BMW Cabrio',
      imagePath: TransportAssets.bmwCabrio,
      details: 'Automatic | 3 seats | Octane',
      distance: '800m',
      time: '5mins away',
    ),
    Car(
      name: 'BMW Cabrio',
      imagePath: TransportAssets.bmwCabrio,
      details: 'Automatic | 3 seats | Octane',
      distance: '800m',
      time: '5mins away',
    ),
    Car(
      name: 'BMW Cabrio',
      imagePath: TransportAssets.bmwCabrio,
      details: 'Automatic | 3 seats | Octane',
      distance: '800m',
      time: '5mins away',
    ),
    Car(
      name: 'BMW Cabrio',
      imagePath: TransportAssets.bmwCabrio,
      details: 'Automatic | 3 seats | Octane',
      distance: '800m',
      time: '5mins away',
    ),
    Car(
      name: 'BMW Cabrio',
      imagePath: TransportAssets.bmwCabrio,
      details: 'Automatic | 3 seats | Octane',
      distance: '800m',
      time: '5mins away',
    ),
  ];

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available cars for ride',
              style: Styles.headingLightBlackText,
            ),
            const Text(
              '18 cars found',
              style: TextStyle(fontSize: 16, color: AppColors.tLightGrey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: availableCars.length,
                itemBuilder: (context, index) {
                  final car = availableCars[index];
                  return CarItem(
                    car: car,
                    onBookLater: () {
                      Navigator.pop(context);
                    },
                    onRideNow: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Material>(
                          builder: (context) => const CarDetailsScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
