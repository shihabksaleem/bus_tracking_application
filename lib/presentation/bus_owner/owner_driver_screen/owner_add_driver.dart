// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class OwnerAddDriver extends StatefulWidget {
  const OwnerAddDriver({super.key});

  @override
  State<OwnerAddDriver> createState() => _OwnerAddDriverState();
}

class _OwnerAddDriverState extends State<OwnerAddDriver> {
  TextEditingController driverNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  File? image;

  // function to select date
  Future selectDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {});
    }
  }

  // function to get image
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
        title: Text("Driver Details",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
        surfaceTintColor: ColorConstants.mainWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // first widget for driver name
              ReusableTextFieldWidget(
                name: "Driver Name",
                controller: driverNameController,
              ),

              // second widget for phone number
              ReusableTextFieldWidget(
                name: "Phone Number",
                controller: phNoController,
              ),

              // widget for address
              ReusableTextFieldWidget(
                name: "Address",
                controller: addressController,
                keyboardType: TextInputType.streetAddress,
                maxLines: 3,
              ),

              // widget for age
              ReusableTextFieldWidget(
                name: "Age",
                controller: ageController,
              ),
              // widget for dob
              ReusableTextFieldWidget(
                name: "Date of Birth",
                controller: dobController,
                onTap: () => {
                  FocusScope.of(context).requestFocus(new FocusNode()),
                  selectDate(dobController),
                },
              ),
              Text(
                "Licence Image",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              //  widget to insert bus image
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
              SizedBox(height: 15),

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
