import 'package:bus_tracking_application/presentation/admin/admin_Request/view/admin_request.dart';
import 'package:bus_tracking_application/presentation/admin/admin_bus_route/view/admin_bus_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int index = 0;
  List bottomscreens = [AdminBusRoute(), AdminRequest(), AdminRequest()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation_rounded),
            label: 'Bus Route',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote),
            label: 'Request',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        currentIndex: index,
      ),
      body: bottomscreens[index],
    );
  }
}
