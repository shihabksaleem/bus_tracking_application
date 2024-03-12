// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OwnerAddBus extends StatefulWidget {
  const OwnerAddBus({super.key});

  @override
  State<OwnerAddBus> createState() => _OwnerAddBusState();
}

class _OwnerAddBusState extends State<OwnerAddBus> {
  TextEditingController busNameController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  TextEditingController rcBookController = TextEditingController();

  String? status;

  File? image;

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Details",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // first widget for bus name
              ReusableTextFieldWidget(
                name: "Bus Name",
                controller: busNameController,
              ),

              // second widget for bus number
              ReusableTextFieldWidget(
                name: "Bus Number",
                controller: busNumberController,
              ),

              // widget for engine number
              ReusableTextFieldWidget(
                name: "Engine Number",
                controller: engineNumberController,
              ),

              // widget for rc book
              ReusableTextFieldWidget(
                name: "RC book",
                controller: rcBookController,
              ),
              Text(
                "Bus Active status",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text("Active"),
                      value: 'active',
                      groupValue: status,
                      activeColor: ColorConstants.mainBlue,
                      onChanged: (sts) {
                        setState(() {
                          status = sts;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text("Inactive"),
                      value: 'inactive',
                      groupValue: status,
                      activeColor: ColorConstants.mainBlue,
                      onChanged: (sts) {
                        setState(() {
                          status = sts;
                        });
                      },
                    ),
                  ),
                ],
              ),

              //  widget to insert bus image
              Text(
                "Bus Image",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: getImage,
                child: image == null
                    ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: Icon(Icons.add_a_photo, size: 40),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 20),

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
