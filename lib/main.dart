import 'package:bus_tracking_application/app_config/app_config_controller.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_user_login/controller/bus_user_controller.dart';
import 'package:bus_tracking_application/presentation/bus_users/user_home_screen/controller/user_home_screen_controller.dart';
import 'package:bus_tracking_application/presentation/common_screen/splash_screen/veiw/splash_screen.dart';
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
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
        ChangeNotifierProvider(create: (context) => UserHomeScreenController()),
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
