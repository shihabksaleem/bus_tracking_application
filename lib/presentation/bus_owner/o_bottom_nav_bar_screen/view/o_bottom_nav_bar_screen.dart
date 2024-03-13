// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/route_selection_screen/view/route_selection_screen.dart';
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
    RouteSelectionScreen(),
    OwnerHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      drawer: ReusableDrawerWidget(
        name: 'username',
        email: 'address',
        drawerItems: [
          DrawerItem(icon: Icons.bus_alert, title: ' Bus Route', onTap: () {}),
          DrawerItem(
              icon: Icons.directions_bus, title: 'Track my bus', onTap: () {}),
          DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),
          DrawerItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Terms & Condition',
              onTap: () {}),
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
          ]),

    );
  }
}
