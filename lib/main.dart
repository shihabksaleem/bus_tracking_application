import 'package:bus_tracking_application/app_config/app_config_controller.dart';
import 'package:bus_tracking_application/presentation/admin/admin_bus_route_bottom_tab/controller/admin_bus_route_bottom_tab_controller.dart';
import 'package:bus_tracking_application/presentation/admin/admin_login/controller/admin_login_screen_controller.dart';
import 'package:bus_tracking_application/presentation/admin/admin_registration/controller/admin_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login_screen/controller/bus_owner_login_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_registration_screen/controller/bus_owner_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_add_driver_screen/controller/o_add_driver_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_buses_assigned_screen/controller/o_busses_assigned_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_busses_bottom_screen/controller/o_busses_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_driver_bottom_screen/controller/o_driver_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_fuel_stations/controller/o_near_by_fuel_stations_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_workshops/controller/o_near_by_fuel_stations_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_routes_bottom_screen/controller/o_routes_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_bus_details/controller/owner_bus_details_screen_controller.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_registration_screen/controller/passenget_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/passenger/passernger_login_screen/controller/passenger_login_screen_controller.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_home_screen/controller/passenger_home_screen_controller.dart';
import 'package:bus_tracking_application/presentation/common_screen/splash_screen/veiw/splash_screen.dart';
import 'package:bus_tracking_application/presentation/passenger/route_details_screen/controller/route_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BusOwnerLoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => PassengerRegistrationScreenController()),
        ChangeNotifierProvider(
            create: (context) => OwnerBusDetailScreenController()),
        ChangeNotifierProvider(
            create: (context) => PassengerLoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => PassengerHomeScreenController()),
        ChangeNotifierProvider(
            create: (context) => RouteDetailsScreenController()),
        ChangeNotifierProvider(
            create: (context) => BusOwnerRegistrationScreenController()),
        ChangeNotifierProvider(
            create: (context) => AdminRegistrationScreenController()),
        ChangeNotifierProvider(
            create: (context) => AdminLoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => ORoutesBottomScreenControlller()),
        ChangeNotifierProvider(
            create: (context) => ODriverBottomScreenController()),
        ChangeNotifierProvider(
            create: (context) => OAddDriverScreenController()),
        ChangeNotifierProvider(
            create: (context) => OBussesBottomScreenController()),
        ChangeNotifierProvider(
            create: (context) => ONearbyFuelStationsScreenController()),
        ChangeNotifierProvider(
            create: (context) => ONearbyWorkShopsScreenController()),
        ChangeNotifierProvider(
            create: (context) => OBussesAssignedScreenController()),
        ChangeNotifierProvider(
            create: (context) => AdminRoutesBottomTabController()),
      ],
      child: MaterialApp(
        navigatorKey: AppConfigController.navigatorState,
        debugShowCheckedModeBanner: false,
        title: 'Vroom',
        home: SplashScreen(),
      ),
    );
  }
}
