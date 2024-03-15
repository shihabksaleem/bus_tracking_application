// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_add_driver_screen/view/o_add_driver_screen.dart';
import 'package:flutter/material.dart';

class OwnerDriverScreen extends StatefulWidget {
  const OwnerDriverScreen({super.key});

  @override
  State<OwnerDriverScreen> createState() => _OwnerDriverScreenState();
}

class _OwnerDriverScreenState extends State<OwnerDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bus Driver Details",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: ColorConstants.mainBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  bottom: BorderSide(
                      color: ColorConstants.mainBlack.withOpacity(0.2),
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Driver Name",
                        style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1234567890",
                        style: TextStyle(
                          color: ColorConstants.mainBlack,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline_rounded,
                          size: 35, color: Colors.red)),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OwnerAddDriverScreen(),
            ),
          );
        },
        backgroundColor: ColorConstants.mainBlue.withOpacity(0.3),
        foregroundColor: ColorConstants.mainWhite,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }
}
