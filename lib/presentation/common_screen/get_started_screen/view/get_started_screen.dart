// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/admin/admin_login/view/admin_login_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login_screen/view/bus_owner_login_screen.dart';
import 'package:bus_tracking_application/presentation/passenger/passernger_login_screen/view/passenger_login_screen.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          // PopupMenuButton(
          //   icon: Icon(Icons.more_vert),
          //   onSelected: (value) {
          //     // your logic
          //   },
          //   itemBuilder: (BuildContext bc) {
          //     return [
          //       // PopupMenuItem(
          //       //   onTap: () {
          //       //     // navigate to bus user

          //       //     Navigator.push(
          //       //         context,
          //       //         MaterialPageRoute(
          //       //           builder: (context) => PassengerLoginScreen(),
          //       //         ));
          //       //   },
          //       //   value: '/user',
          //       //   child: Text("Bus user"),
          //       // ),
          //       // PopupMenuItem(
          //       //   onTap: () {
          //       //     // navigate to owner screen
          //       //     Navigator.push(
          //       //         context,
          //       //         MaterialPageRoute(
          //       //           builder: (context) => BusOwnerLoginScreen(),
          //       //         ));
          //       //   },
          //       //   child: Text("Owner"),
          //       //   value: '/owner',
          //       // ),
          //       // PopupMenuItem(
          //       //   onTap: () {
          //       //     // navigate to admin screen
          //       //     Navigator.push(
          //       //         context,
          //       //         MaterialPageRoute(
          //       //           builder: (context) => AdminLoginScreen(),
          //       //         ));
          //       //   },
          //       //   value: '/admin',
          //       //   child: Text("Adim"),
          //       // )
          //     ];
          //   },
          // )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.bustrackingImgJpg),
            SizedBox(height: 10),
            Text(
              "Welcome to Vroom",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: ColorConstants.mainBlue),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PassengerLoginScreen(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.mainLightBlue,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                      child: Text(
                    "Passenger",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusOwnerLoginScreen(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.lightyellow,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                      child: Text(
                    "Bus Owner",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  //      navigate to admin screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoginScreen(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.lightPink,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                      child: Text(
                    "Admin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
