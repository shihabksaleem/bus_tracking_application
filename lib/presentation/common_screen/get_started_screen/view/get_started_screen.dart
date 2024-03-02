// ignore_for_file: prefer_const_constructors

import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_user_login/view/bus_user_login.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              // your logic
            },
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  onTap: () {
                    // navigate to bus user
                  },
                  child: Text("Bus user"),
                  value: '/user',
                ),
                PopupMenuItem(
                  onTap: () {
                    // navigate to owner screen
                  },
                  child: Text("Owner"),
                  value: '/owner',
                ),
                PopupMenuItem(
                  onTap: () {
                    // navigate to admin screen
                  },
                  child: Text("Adim"),
                  value: '/admin',
                )
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.bustrackingImgJpg),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusUserLogin(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                      child: Text(
                    "Explore Now",
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
