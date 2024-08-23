import 'package:flutter/material.dart';
import 'package:transporter/data/models/transport/transport_option.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/transport/available_cars_screen.dart';
import 'package:transporter/values/assets/transport_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class TransportSelectionScreen extends StatefulWidget {
  const TransportSelectionScreen({super.key});

  @override
  _TransportSelectionScreenState createState() =>
      _TransportSelectionScreenState();
}

class _TransportSelectionScreenState extends State<TransportSelectionScreen> {
  String? selectedTransport;

  final List<TransportOption> transportOptions = [
    TransportOption(name: 'Car', imagePath: TransportAssets.car),
    TransportOption(name: 'Bike', imagePath: TransportAssets.bike),
    TransportOption(name: 'Cycle', imagePath: TransportAssets.cycle),
    TransportOption(name: 'Taxi', imagePath: TransportAssets.taxi),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
          hasTitle: true,
          title: 'Select transport',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Select your transport',
              style: Styles.headingLightBlackText,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: transportOptions.length,
                itemBuilder: (context, index) {
                  final transport = transportOptions[index];
                  final isSelected = transport.name == selectedTransport;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTransport = transport.name;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute<Material>(
                          builder: (context) => AvailableCarsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.tLighterBackgroundGreen
                            : AppColors.tLightBackgroundGrey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.tGreen
                              : AppColors.lightBlack,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(transport.imagePath, height: 50),
                          const SizedBox(height: 8),
                          Text(
                            transport.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
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
