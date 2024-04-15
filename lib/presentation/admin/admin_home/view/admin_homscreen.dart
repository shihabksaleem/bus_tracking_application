import 'package:bus_tracking_application/presentation/admin/admin_owners_bottom_tab/view/admin_owners_bottom_tab.dart';
import 'package:bus_tracking_application/presentation/admin/admin_bus_route_bottom_tab/view/admin_bus_route_bottom_tab.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_fuel_stations/view/o_nearby_fuel_stations_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_workshops/view/o_near_by_workshops.dart';
import 'package:bus_tracking_application/presentation/common_screen/get_started_screen/view/get_started_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_drawer_widget.dart';
import 'package:bus_tracking_application/presentation/passenger/terms_and_conditions_screen/view/terms_and_conditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int index = 0;
  List bottomscreens = [
    AdminBusRouteBottomTab(),
    AdminOwnersBottomTab(),
    AdminOwnersBottomTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: ReusableDrawerWidget(
        name: 'Admin',
        email: 'Panel',
        drawerItems: [
          // DrawerItem(
          //     icon: Icons.filter_list_alt,
          //     title: 'Near by fuel stations',
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ONearbyFuelStations(),
          //           ));
          //     }),
          // DrawerItem(
          //     icon: Icons.miscellaneous_services_sharp,
          //     title: 'Near by work shops',
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ONearbyWorkshops(),
          //           ));
          //     }),
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
