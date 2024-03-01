// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.mapSampleImageJpg,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            //#1 search widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(4, 6),
                          blurRadius: 8,
                          color: ColorConstants.mainBlack.withOpacity(.5))
                    ]),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "From",
                          fillColor: ColorConstants.mainWhite,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.blue,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "To",
                          fillColor: ColorConstants.mainWhite,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.blue,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          10,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 6),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstants.mainWhite,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(6, 6),
                                            blurRadius: 8,
                                            color: ColorConstants.mainBlack
                                                .withOpacity(.6))
                                      ]),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Bus name"),
                                          SizedBox(height: 3),
                                          Text("Ac/non Ac"),
                                          SizedBox(height: 3),
                                          Text("1 stop away"),
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
                              )),
                    ),
                  ),
                ),
              ),
            ),

            //#2 Sujested locations

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4, 6),
                              blurRadius: 8,
                              color: ColorConstants.mainBlack.withOpacity(.5))
                        ]),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.message, color: Colors.green),
                            SizedBox(width: 20),
                            Text("Location")
                          ],
                        ),
                        SizedBox(height: 20),
                        Text("2 km")
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    ));
  }
}
