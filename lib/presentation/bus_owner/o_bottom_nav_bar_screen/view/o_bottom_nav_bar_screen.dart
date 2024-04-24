// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/presentation/bus_owner/o_driver_bottom_screen/view/o_driver_bottom_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_fuel_stations/view/o_nearby_fuel_stations_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_workshops/view/o_near_by_workshops.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_routes_bottom_screen/view/o_routes_bottom_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_busses_bottom_screen/view/o_busses_bottom_screen.dart';
import 'package:bus_tracking_application/presentation/passenger/terms_and_conditions_screen/view/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../common_screen/get_started_screen/view/get_started_screen.dart';
import '../../../global_widgets/reusable_drawer_widget.dart';

class OBottomNavBarScreen extends StatefulWidget {
  const OBottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<OBottomNavBarScreen> createState() => _OBottomNavBarScreenState();
}

class _OBottomNavBarScreenState extends State<OBottomNavBarScreen> {
  int selectedTabIndex = 0;

  final List<Widget> ownerMainScreens = [
    ORoutesBottomScreen(),
    OBusesBottomScreen(),
    OwnerDriverScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: ReusableDrawerWidget(
        name: 'Bus Owner',
        email: "",
        drawerItems: [
          DrawerItem(
              icon: Icons.filter_list_alt,
              title: 'Near by fuel stations',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ONearbyFuelStations(),
                    ));
              }),
          DrawerItem(
              icon: Icons.miscellaneous_services_sharp,
              title: 'Near by work shops',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ONearbyWorkshops(),
                    ));
              }),
          // DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),
          DrawerItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Terms & Condition',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ));
              }),
          DrawerItem(
              icon: Icons.power_settings_new,
              title: 'Logout',
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GetStartedScreen(),
                    ));
              }),
        ],
      ),
      body: ownerMainScreens[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (value) {
            setState(() {
              selectedTabIndex = value;
            });
          },
          selectedItemColor: ColorConstants.mainBlue,
          unselectedItemColor: ColorConstants.mainBlack.withOpacity(.4),
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.route),
                icon: Icon(Icons.route_outlined),
                label: "Routes"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.directions_bus_filled_sharp),
                icon: Icon(Icons.directions_bus_outlined),
                label: "Busses"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.personal_injury_sharp),
                icon: Icon(Icons.personal_injury_outlined),
                label: "Driver"),
          ]),
    );
  }
}
