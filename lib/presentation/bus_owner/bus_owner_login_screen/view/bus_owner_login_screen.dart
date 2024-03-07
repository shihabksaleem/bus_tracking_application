import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_registration_screen/view/bus_owner_registration_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusOwnerLoginScreen extends StatelessWidget {
  final ownerController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    "Bus Owner Login",
                    style: GoogleFonts.roboto(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Column(children: [
                  ///First Widget for owners email address
                  ReusableTextFieldWidget(
                    name: "Email Address",
                    prefixIcon: Icon(Icons.email),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  ///Second Widget for Owner password
                  ReusableTextFieldWidget(
                    name: "Password",
                    prefixIcon: Icon(Icons.password),
                    controller: passController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        onPressed: () {},
                        child: const Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )),
                  const SizedBox(
                    height: 30,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BusOwnerRegistrationScreen()));
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account ",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      TextSpan(
                          text: "Register",
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