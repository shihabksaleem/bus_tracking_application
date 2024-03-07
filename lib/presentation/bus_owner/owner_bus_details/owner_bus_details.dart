// ignore_for_file: prefer_const_constructors

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';

class OwnerBusDetails extends StatefulWidget {
  const OwnerBusDetails({super.key});

  @override
  State<OwnerBusDetails> createState() => _OwnerBusDetailsState();
}

class _OwnerBusDetailsState extends State<OwnerBusDetails> {
  TextEditingController busNameController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();

  // sample list off bus routes
  List<String> busRoute = [
    "route1 : route1",
    "route2 : route2",
    "route3 : route3",
    "route4 : route4",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Details",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // first widget for bus name
            ReusableTextFieldWidget(
              name: "Bus Name",
              controller: busNameController,
            ),

            // first widget for bus number
            ReusableTextFieldWidget(
              name: "Bus Number",
              controller: busNumberController,
            ),
            Text(
              "Bus Route",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),

            // widget to select bus route
            SizedBox(
              height: 50,
              child: DropdownMenu(
                expandedInsets: EdgeInsets.all(0),
                hintText: "Bus Route",
                inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                dropdownMenuEntries:
                    busRoute.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
            SizedBox(height: 50),

            // widget for confirm button
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstants.mainBlue),
                    shape: MaterialStatePropertyAll(StadiumBorder())),
                onPressed: () {
                  _showLogoutDialogBox(context);
                },
                child: const Text("Confirm",
                    style: TextStyle(
                        color: ColorConstants.mainWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog box to confirm
  Future<void> _showLogoutDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Are you sure?",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(color: ColorConstants.mainBlue),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OwnerHomeScreen(),
                      ),
                      (route) => false);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: ColorConstants.mainBlue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
