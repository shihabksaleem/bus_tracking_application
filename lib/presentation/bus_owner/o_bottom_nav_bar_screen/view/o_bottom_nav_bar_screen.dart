// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/route_selection_screen/view/route_selection_screen.dart';
import 'package:flutter/material.dart';

class OBottomNavBarScreen extends StatefulWidget {
  const OBottomNavBarScreen({super.key});

  @override
  State<OBottomNavBarScreen> createState() => _OBottomNavBarScreenState();
}

class _OBottomNavBarScreenState extends State<OBottomNavBarScreen> {
  int selectedTabIndex = 0;

  List<Widget> ownerMainScreens = [
    RouteSelectionScreen(),
    OwnerHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ownerMainScreens[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (value) {
            selectedTabIndex = value;

            setState(() {});
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
