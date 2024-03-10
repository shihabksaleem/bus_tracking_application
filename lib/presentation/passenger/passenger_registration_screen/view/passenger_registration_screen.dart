import 'package:bus_tracking_application/presentation/passenger/passernger_login_screen/view/passenger_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../global_widgets/reusable_textfield_widget.dart';

class PassengerRegistrationScreen extends StatelessWidget {
  PassengerRegistrationScreen({super.key});

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PassengerLoginScreen()));
                },
                icon: Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(ImageConstants.loginRegistrationPng),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Join Bustapp \ncommunity",
                    style: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      //first widget
                      ReusableTextFieldWidget(
                          prefixIcon: const Icon(Icons.email, color: ColorConstants.iconBlue),
                          name: "UserName",
                          controller: userNameController,
                          keyboardType: TextInputType.emailAddress),
                      //second widget
                      ReusableTextFieldWidget(
                          prefixIcon: const Icon(Icons.email, color: ColorConstants.iconBlue),
                          name: "Email Address",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress),
                      //Third widget

                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.password, color: ColorConstants.iconBlue),
                        name: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //fourth widget
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(StadiumBorder())),
                      onPressed: () {},
                      child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 25)),
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
