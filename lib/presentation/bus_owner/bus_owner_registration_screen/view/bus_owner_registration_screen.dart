import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login_screen/view/bus_owner_login_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_registration_screen/controller/bus_owner_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../owner_home_screen/owner_home_screen.dart';

class BusOwnerRegistrationScreen extends StatelessWidget {
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  //form key
  final userNameFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final phoneNumberFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();

  BusOwnerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationProvider =
        Provider.of<BusOwnerRegistrationScreenController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 50),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(ImageConstants.loginRegistrationPng)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Bus Owner Registration",
                    style: GoogleFonts.roboto(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(children: [
                  ///First widget for owner name
                  ReusableTextFieldWidget(
                    name: "Name",
                    prefixIcon: const Icon(Icons.person),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    formKey: nameFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                  ),

                  ///Second Widget for owners email address
                  ReusableTextFieldWidget(
                    name: "User Name",
                    prefixIcon: const Icon(Icons.email),
                    controller: userNameController,
                    keyboardType: TextInputType.emailAddress,
                    formKey: userNameFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your user name';
                      }
                      return null;
                    },
                  ),

                  ///Third Widget for Owner password
                  ReusableTextFieldWidget(
                    name: "Password",
                    prefixIcon: const Icon(Icons.password),
                    controller: passController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    formKey: passwordFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  ///Fourth widget for phone number
                  ReusableTextFieldWidget(
                    name: "PhoneNumber",
                    prefixIcon: const Icon(Icons.phone),
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    formKey: phoneNumberFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your phone number';
                      } else if (value.length<10) {
                        return 'please enter 10 digit phone number';
                      }
                      return null;
                    },
                  ),

                  ///Fifth widget for address
                  ReusableTextFieldWidget(
                    name: "Address",
                    prefixIcon: const Icon(Icons.home),
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    formKey: addressFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  registrationProvider.isLoading
                      ? const Center(
                          child: ReusableLoadingWidget(),
                        )
                      : SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shape:
                                    MaterialStatePropertyAll(StadiumBorder())),
                            onPressed: () {
                              if (nameFormKey.currentState!.validate() &&
                                  userNameFormKey.currentState!.validate() &&
                                  passwordFormKey.currentState!.validate() &&
                                  phoneNumberFormKey.currentState!.validate() &&
                                  addressFormKey.currentState!.validate()) {
                                Provider.of<BusOwnerRegistrationScreenController>(
                                        context,
                                        listen: false)
                                    .onRegister(
                                        name: nameController.text,
                                        userName: userNameController.text,
                                        password: passController.text,
                                        phoneNumber: phoneNumberController.text,
                                        address: addressController.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OwnerHomeScreen(),
                                        ),
                                        (route) => false);
                                  }
                                });
                              }
                            },
                            child: const Text("Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          )),
                  const SizedBox(
                    height: 30,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusOwnerLoginScreen()));
                    },
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Already have an account ",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      TextSpan(
                          text: "Login",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))
                    ])),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
