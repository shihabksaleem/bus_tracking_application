import 'package:bus_tracking_application/app_config/app_config_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login_screen/controller/bus_owner_login_screen_controller.dart';
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
            create: (context) => PassengerLoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => PassengerHomeScreenController()),
        ChangeNotifierProvider(
            create: (context) => RouteDetailsScreenController()),
        ChangeNotifierProvider(
            create: (context) => BusOwnerLoginScreenController()),
      ],
      child: MaterialApp(
        navigatorKey: AppConfigController.navigatorState,
        debugShowCheckedModeBanner: false,
        title: 'Luminar Technolab',
        home: SplashScreen(),
      ),
    );
  }
}
