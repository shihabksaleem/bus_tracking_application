import 'dart:async';

import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/admin/admin_login/view/admin_login_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_home_screen/view/passenger_home_screen.dart';
import 'package:bus_tracking_application/presentation/common_screen/get_started_screen/view/get_started_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      final token = await AppUtils.getAccessKey();

      if (token != null && token.isNotEmpty) {
        final userType = await AppUtils.getUserType();

        if (userType == "passenger") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PassengerHomeScreen(),
              ));
        } else if (userType == "admin") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminLoginScreen(),
              ));
        } else if (userType == "owner") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OwnerHomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GetStartedScreen(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetStartedScreen(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageConstants.appLogopngPng,
              scale: 8,
            ),
            const SizedBox(height: 30),
            const ReusableLoadingWidget()
          ],
        ),
      ),
    );
  }
}
