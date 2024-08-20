import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transporter/data/enums/bottom_navigation_links.dart';
import 'package:transporter/data/enums/service_type.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/home_assets.dart';
import 'package:transporter/values/assets/navigation_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/home/visual/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _listTextTabToggle =
      ServiceType.values.map((e) => e.getStringFromServiceType).toList();
  final ValueNotifier<int> _tabIndexBasicToggle = ValueNotifier(1);
  GoogleMapController? mapController;
  final Set<Marker> _markers = {};
  LatLng startLocation = const LatLng(-1.9524035, 30.0892928);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const CustomDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: Stack(
          children: [
            GoogleMap(
              key: const Key('map'),
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: startLocation, //initial position
                zoom: 14,
              ),
              myLocationButtonEnabled: false,
              onLongPress: print,
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              },
              onTap: (latLng) async {},
            ),
            Positioned(
              key: const Key('customAppBar'),
              top: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.marginSmall,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => TextButton(
                          key: const Key('hamburgerMenu'),
                          child: SvgPicture.asset(
                            HomeAssets.hamburgerMenu,
                            width: 34,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                      IconButton(
                        key: const Key('notificationsButton'),
                        icon: SvgPicture.asset(
                          HomeAssets.notificationIcon,
                          width: 34,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              key: const Key('seachAndToggle'),
              bottom: 40,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRentalButton(),
                      const SizedBox(height: 16),
                      _buildSearchAndToggle(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  ElevatedButton _buildRentalButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tGreen,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
      ),
      child: Text(
        Strings.of(context).home_rental_button_heading,
        style: Styles.mediumWhiteText,
      ),
    );
  }

  Widget _buildSearchAndToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.tLighterBackgroundGreen,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: Column(
        children: [
          _buildSearchField(),
          const SizedBox(height: 16),
          _buildToggleTab(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.tLighterGreen,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintText: Strings.of(context).home_address_input_hint,
          hintStyle: Styles.regularGreyParagraph,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              HomeAssets.searchIcon,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              HomeAssets.favoriteIcon,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleTab() {
    return ValueListenableBuilder<int>(
      valueListenable: _tabIndexBasicToggle,
      builder: (context, currentIndex, _) {
        return FlutterToggleTab(
          width: 90,
          borderRadius: Dimensions.radiusDefault,
          height: 50,
          selectedIndex: currentIndex,
          unSelectedBackgroundColors: const [
            AppColors.tLighterGreen,
            AppColors.tLighterGreen,
          ],
          selectedBackgroundColors: const [
            AppColors.tGreen,
            AppColors.tGreen,
          ],
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          unSelectedTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          labels: _listTextTabToggle,
          selectedLabelIndex: (index) {
            _tabIndexBasicToggle.value = index;
          },
          isScroll: false,
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _onItemTapped(2),
      backgroundColor: AppColors.tLightGreen,
      shape: const _HexagonBorder(xOffset: 8, scaleFactor: 1.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 15),
        child: SvgPicture.asset(NavigationAssets.wallet, width: 20),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomAppBar(
        height: 70,
        notchMargin: 0,
        shadowColor: Colors.transparent,
        color: AppColors.tWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: BottomNavigationLinks.values
              .map(
                (e) => _buildNavBarItem(
                  index: e.index,
                  iconPhoto: e.icon,
                  label: e.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required int index,
    required String label,
    String? iconPhoto,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPhoto != null)
            SvgPicture.asset(
              iconPhoto,
              colorFilter: ColorFilter.mode(
                _selectedIndex == index ? AppColors.tGreen : AppColors.tGrey,
                BlendMode.srcIn,
              ),
            ),
          if (iconPhoto != null)
            const SizedBox(height: 8)
          else
            const SizedBox(height: 26),
          Text(
            label,
            style: _selectedIndex == index
                ? Styles.smallParagraphLightGreen
                : Styles.smallParagraphGrey,
          ),
        ],
      ),
    );
  }
}

class _HexagonBorder extends ShapeBorder {
  const _HexagonBorder({this.xOffset = 0, this.scaleFactor = 1.0});
  final double scaleFactor;
  final double xOffset;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(8);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _createHexagonPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => _HexagonBorder(xOffset: xOffset * t);

  Path _createHexagonPath(Rect rect) {
    final width = rect.width * scaleFactor;
    final height = rect.height * scaleFactor;

    return Path()
      ..moveTo(width * 0.50 + xOffset, 0)
      ..lineTo(width * 0.93 + xOffset, height * 0.25)
      ..lineTo(width * 0.93 + xOffset, height * 0.75)
      ..lineTo(width * 0.50 + xOffset, height)
      ..lineTo(width * 0.07 + xOffset, height * 0.75)
      ..lineTo(width * 0.07 + xOffset, height * 0.25)
      ..close();
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder? a, double t) => this;

  @override
  ShapeBorder lerpTo(ShapeBorder? b, double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
