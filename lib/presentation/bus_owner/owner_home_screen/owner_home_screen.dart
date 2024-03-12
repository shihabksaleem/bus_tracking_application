// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_bus_screen/owner_bus_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_driver_screen/owner_driver_screen.dart';
import 'package:flutter/material.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  var indexNum = 0;
  List tabWidgetsList = [
    OwnerBusScreen(),
    OwnerDriverScreen(),
    // OwnerBusRoute(),
    // OwnerbusAssigned(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            label: "Buses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Driver",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined),
            label: "Route",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: "Assigned",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorConstants.mainBlue.withOpacity(0.2),
        elevation: 0,
        iconSize: 30,
        selectedItemColor: ColorConstants.mainBlue,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        currentIndex: indexNum,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
      body: tabWidgetsList.elementAt(indexNum),
    );
  }
}
