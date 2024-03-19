// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_add_driver_screen/controller/o_add_driver_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_bottom_nav_bar_screen/view/o_bottom_nav_bar_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_driver_bottom_screen/controller/o_driver_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OwnerAddDriverScreen extends StatefulWidget {
  const OwnerAddDriverScreen({super.key});

  @override
  State<OwnerAddDriverScreen> createState() => _OwnerAddDriverScreenState();
}

class _OwnerAddDriverScreenState extends State<OwnerAddDriverScreen> {
  TextEditingController driverNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  var nameFormKey = GlobalKey<FormState>();
  var addressFormKey = GlobalKey<FormState>();
  var phNoFormKey = GlobalKey<FormState>();
  var ageFormKey = GlobalKey<FormState>();
  var dobFormKey = GlobalKey<FormState>();
  // File? image;

  // function to select date
  Future selectDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {});
    }
  }

  // // function to get image
  // Future getImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final providerState = Provider.of<OAddDriverScreenController>(context);
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
                formKey: nameFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a driver name';
                  }
                  return null;
                },
              ),

              ReusableTextFieldWidget(
                name: "Phone Number",
                keyboardType: TextInputType.streetAddress,
                controller: phNoController,
                formKey: phNoFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  // You can add more specific validation logic here
                  return null;
                },
              ),

              ReusableTextFieldWidget(
                name: "Address",
                controller: addressController,
                formKey: addressFormKey,
                keyboardType: TextInputType.streetAddress,
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  // You can add more specific validation logic here
                  return null;
                },
              ),

              ReusableTextFieldWidget(
                name: "Age",
                keyboardType: TextInputType.number,
                controller: ageController,
                formKey: ageFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an age';
                  }
                  // You can add more specific validation logic here
                  return null;
                },
              ),

              ReusableTextFieldWidget(
                name: "Date of Birth",
                controller: dobController,
                formKey: dobFormKey,
                onTap: () => {
                  FocusScope.of(context).requestFocus(new FocusNode()),
                  selectDate(dobController),
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date of birth';
                  }
                  // You can add more specific validation logic here
                  return null;
                },
              ),

              // Text(
              //   "Licence Image",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              // ),
              // SizedBox(height: 10),
              //  widget to insert bus image
              // GestureDetector(
              //   onTap: getImage,
              //   child: image == null
              //       ? Container(
              //           width: 100,
              //           height: 100,
              //           color: Colors.grey,
              //           child: Icon(Icons.add_a_photo, size: 40),
              //         )
              //       : Container(
              //           width: 150,
              //           height: 150,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.rectangle,
              //             image: DecorationImage(
              //               image: FileImage(image!),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              // ),
              // SizedBox(height: 15),

              // widget for confirm button
              providerState.isPostLoading
                  ? ReusableLoadingWidget()
                  : SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorConstants.mainBlue),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        onPressed: () async {
                          if (nameFormKey.currentState!.validate() &&
                              phNoFormKey.currentState!.validate() &&
                              addressFormKey.currentState!.validate() &&
                              ageFormKey.currentState!.validate() &&
                              dobFormKey.currentState!.validate()) {
                            await Provider.of<OAddDriverScreenController>(
                                    context,
                                    listen: false)
                                .addNewDriver(
                                    name: driverNameController.text.trim(),
                                    address: addressController.text.trim(),
                                    age: ageController.text.trim(),
                                    dob: dobController.text.trim(),
                                    phone: phNoController.text.trim())
                                .then((value) async {
                              Navigator.pop(context);
                              await Provider.of<ODriverBottomScreenController>(
                                      context,
                                      listen: false)
                                  .getDriversList();
                            });
                          } else {
                            // Display validation errors if any
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    'Please fill in all fields correctly.'),
                              ),
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
}
