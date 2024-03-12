import 'dart:math';

import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_registration_screen/controller/passenget_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/passenger/passernger_login_screen/view/passenger_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../global_widgets/reusable_textfield_widget.dart';

class PassengerRegistrationScreen extends StatelessWidget {
  PassengerRegistrationScreen({super.key});

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  //form keys
  final nameFormKey = GlobalKey<FormState>();
  final userNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final regScreenData =
        Provider.of<PassengerRegistrationScreenController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PassengerLoginScreen()));
                },
                icon: Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Image.asset(ImageConstants.loginRegistrationPng),
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Join Bustapp community",
                    style: GoogleFonts.roboto(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "name",
                        controller: nameController,
                        formKey: nameFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      //first widget
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "UserName",
                        controller: userNameController,
                        formKey: userNameFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      //first widget
                      //second widget
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "Phone number",
                        controller: phoneController,
                        formKey: phoneFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      //second widget
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "Email Address",
                        controller: emailController,
                        formKey: emailFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ), //second widget
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "Address",
                        controller: addressController,
                        formKey: addressFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      //Third widget

                      ReusableTextFieldWidget(
                          prefixIcon: const Icon(Icons.password,
                              color: ColorConstants.iconBlue),
                          name: "Password",
                          controller: passwordController,
                          formKey: passwordFormKey,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //fourth widget
                regScreenData.isLoading
                    ? Center(
                        child: ReusableLoadingWidget(),
                      )
                    : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(StadiumBorder())),
                          onPressed: () {
                            // Validate all the form fields
                            if (nameFormKey.currentState!.validate() &&
                                userNameFormKey.currentState!.validate() &&
                                phoneFormKey.currentState!.validate() &&
                                emailFormKey.currentState!.validate() &&
                                addressFormKey.currentState!.validate() &&
                                passwordFormKey.currentState!.validate()) {
                              Provider.of<PassengerRegistrationScreenController>(
                                      context,
                                      listen: false)
                                  .onPasssengerLogin(
                                      userName: userNameController.text,
                                      password: passwordController.text,
                                      emailAddress: emailController.text,
                                      address: addressController.text,
                                      phone: phoneController.text,
                                      name: nameController.text)
                                  .then((value) {
                                if (value) {
                                  AppUtils.oneTimeSnackBar(
                                    "Registration Success",
                                    context: context,
                                    bgColor: ColorConstants.mainGreen,
                                  );

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PassengerLoginScreen(),
                                      ));
                                }
                              });
                            }
                          },
                          child: const Text("Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
