// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/passenger/bus_tracking_screen/view/bus_tracking_screen.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/search_result_res_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PassengerHomeScreenBussesCard extends StatelessWidget {
  const PassengerHomeScreenBussesCard({
    super.key,
    required this.name,
    required this.busNumber,
    required this.busRoute,
    required this.imagePath,
    required this.routeId,
    this.routeAssignments = const [],
  });

  final String name;
  final List<RouteAssignment>? routeAssignments;
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
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.blueBusPng))),
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
                  SizedBox(
                    width: 160,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal, // default
                      children: List.generate(
                        routeAssignments?.length ?? 0,
                        (index) {
                          // Parse the time string
                          DateTime? time = DateFormat('HH:mm:ss').tryParse(
                              routeAssignments?[index].startTime.toString() ??
                                  "");
                          String? time12Hour;
                          // Format the time to 12-hour format with AM/PM
                          if (time != null) {
                            time12Hour = DateFormat('h:mm a').format(time);
                          }

                          return time12Hour != null
                              ? Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                      color: Colors.grey.withOpacity(.3),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      child: Text(
                                        time12Hour.toString() ?? "",
                                        style: TextStyle(fontSize: 12),
                                      )),
                                )
                              : SizedBox();
                        },
                      ),
                    ),
                  ),
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
