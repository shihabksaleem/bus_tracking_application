// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_bottom_nav_bar_screen/view/o_bottom_nav_bar_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_bus_details/controller/owner_bus_details_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_utils/app_utils.dart';

class OwnerBusDetails extends StatefulWidget {
  const OwnerBusDetails({super.key});

  @override
  State<OwnerBusDetails> createState() => _OwnerBusDetailsState();
}

class _OwnerBusDetailsState extends State<OwnerBusDetails> {
  TextEditingController busNameController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  File? selectedImage;

//form keys
  final busNameFormKey = GlobalKey<FormState>();
  final busNumberFormKey = GlobalKey<FormState>();

//to hold the selected drop down value
  bool? selectedIsActive = true;

  // sample list off bus routes
  List<bool> isActiveOptions = [true, false];

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _pickImageDialog,
      icon: const Icon(Icons.camera_alt_outlined),
      label: const Text("Upload Bus Image"),
    );

    if (selectedImage != null) {
      content = GestureDetector(
        onTap: _pickImageDialog,
        child: Image.file(
          selectedImage!,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Details",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // first widget for bus name
              ReusableTextFieldWidget(
                name: "Bus Name",
                controller: busNameController,
                formKey: busNameFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the bus name';
                  }
                  return null;
                },
              ),

              // second widget for bus number
              ReusableTextFieldWidget(
                name: "Bus Number",
                controller: busNumberController,
                formKey: busNumberFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the bus number ';
                  }
                  return null;
                },
              ),
              ReusableTextFieldWidget(
                name: "Engine number",
                controller: engineNumberController,
                // formKey: busNameFormKey,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'please enter the bus name';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 10),
              // Text(
              //   "Bus Image",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              // ),
              // SizedBox(height: 10),
              //third widget to upload bus image
              // Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //             width: 1, color: Colors.black.withOpacity(0.2))),
              //     height: 250,
              //     width: double.infinity,
              //     child: content),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Bus Status ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 50,
                    child: DropdownButton<bool>(
                      hint: Text('Select'),
                      value: selectedIsActive,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedIsActive = value; // Update the selected value
                        });
                      },
                      items: isActiveOptions.map((bool value) {
                        return DropdownMenuItem<bool>(
                          value: value,
                          child: Text(value.toString().toUpperCase()),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              // widget to select ISAcTive route

              SizedBox(height: 10),
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
                    if (busNameFormKey.currentState!.validate() &&
                        busNumberFormKey.currentState!.validate() &&
                        selectedImage != null &&
                        selectedIsActive != null) {
                      _showLogoutDialogBox(context);
                    } else {
                      AppUtils.oneTimeSnackBar(
                        "Please Fill all the fields",
                        context: context,
                        bgColor: ColorConstants.mainRed,
                      );
                    }
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

  // Dialog box to confirm yes or no
  Future<void> _showLogoutDialogBox(BuildContext context) async {
    final ownerController =
        Provider.of<OwnerBusDetailScreenController>(context, listen: false);
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
              ownerController.isLoading
                  ? Center(
                      child: ReusableLoadingWidget(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Provider.of<OwnerBusDetailScreenController>(context,
                                listen: false)
                            .toAddNewBusList(
                          busName: busNameController.text,
                          busNumber: busNumberController.text,
                          engineNumber: engineNumberController.text,
                          image: selectedImage!.absolute,
                          isActive: selectedIsActive == "True" ? true : false,
                        )
                            .then((value) {
                          if (value) {
                            AppUtils.oneTimeSnackBar(
                              "New bus Added SuccessFully",
                              context: context,
                              bgColor: ColorConstants.mainGreen,
                            );

                            // Navigator.pop(context);
                          } else {
                            AppUtils.oneTimeSnackBar(
                              "failed to add",
                              context: context,
                              bgColor: ColorConstants.mainRed,
                            );
                          }
                        });

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OBottomNavBarScreen(),
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

  //to show the options of image
  void _pickImageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Choose Image From"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                pickImage("camera");
              },
              child: Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                pickImage("Gallery");
              },
              child: Text("Gallery"),
            ),
          ],
        ),
      ),
    );
  }

//to pick the image
  Future<void> pickImage(String imageFrom) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source:
            imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery,
        maxHeight: 600);
    if (pickedImage == null) {
      return null;
    } else {
      setState(() {
        selectedImage = File(pickedImage.path); //as pickedImage is XFile type
      });
    }
  }
}
