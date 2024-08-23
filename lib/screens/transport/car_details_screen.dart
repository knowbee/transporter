import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/transport/request_for_rent_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
        ),
      ),
      body: ResponsiveLayout(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarHeader(context),
              const SizedBox(height: 16),
              _buildSpecifications(),
              const SizedBox(height: 16),
              _buildCarFeatures(),
              const Spacer(),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarHeader(BuildContext context) {
    final carImages = <String>[
      TransportAssets.mustang,
      TransportAssets.mustang,
      TransportAssets.mustang,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mustang Shelby GT',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 18),
            SizedBox(width: 4),
            Text('4.9', style: TextStyle(fontSize: 16)),
            SizedBox(width: 4),
            Text(
              '(531 reviews)',
              style: TextStyle(fontSize: 16, color: AppColors.tLightGrey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: carImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: 150,
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              left: 8,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Color(0xFF414141)),
                onPressed: _carouselController.previousPage,
              ),
            ),
            Positioned(
              right: 8,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF414141),
                ),
                onPressed: _carouselController.nextPage,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16, // Horizontal spacing between items
          runSpacing: 16, // Vertical spacing between rows
          children: [
            _buildSpecificationItem(Icons.speed, 'Max Power', '760hp'),
            _buildSpecificationItem(Icons.emoji_flags, 'Top Speed', '180mph'),
            _buildSpecificationItem(Icons.timer, '0-60mph', '3.5s'),
            _buildSpecificationItem(Icons.local_gas_station, 'Fuel', 'Octane'),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecificationItem(
    IconData iconData,
    String title,
    String subtitle,
  ) {
    return Container(
      width: 75,
      height: 75,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.tLightGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: AppColors.tGreen, size: 24),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: AppColors.tLightGrey),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCarFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Car Features',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildFeatureItem('Model', 'GT500'),
        _buildFeatureItem('Capacity', '760hp'),
        _buildFeatureItem('Color', 'Red'),
        _buildFeatureItem('Fuel type', 'Octane'),
        _buildFeatureItem('Drive type', 'Automatic'),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFeatureItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.tLightGreen.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.tGreen),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: AppColors.tLightGrey),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Material>(
                  builder: (context) => const RequestForRentScreen(),
                ),
              );
            },
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
    );
  }
}