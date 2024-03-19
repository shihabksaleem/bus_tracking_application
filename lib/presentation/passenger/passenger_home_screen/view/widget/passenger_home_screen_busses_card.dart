// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/passenger/bus_tracking_screen/view/bus_tracking_screen.dart';
import 'package:bus_tracking_application/repository/api/passenger/route_details_screen/models/route_and_bus_details_res_model.dart';
import 'package:flutter/material.dart';

class PassengerHomeScreenBussesCard extends StatelessWidget {
  const PassengerHomeScreenBussesCard({
    super.key,
    required this.name,
    required this.busNumber,
    required this.busRoute,
    required this.imagePath,
    required this.routeId,
  });

  final String name;
  final String busNumber;
  final String busRoute;
  final String imagePath;
  final String routeId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusTrackingScreen(
                busName: name,
                routeId: routeId,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.mainWhite,
              boxShadow: [
                BoxShadow(
                    offset: Offset(6, 6),
                    blurRadius: 8,
                    color: ColorConstants.mainBlack.withOpacity(.6))
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(File(imagePath)),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(height: 3),
                  Text(busNumber),
                  SizedBox(height: 3),
                  // Text(busRoute),
                ],
              ),
              Spacer(),
              Icon(
                Icons.call_split_rounded,
                color: ColorConstants.mainBlue,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
