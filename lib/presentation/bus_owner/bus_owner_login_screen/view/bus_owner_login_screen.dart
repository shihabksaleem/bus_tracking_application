import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login_screen/controller/bus_owner_login_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_registration_screen/view/bus_owner_registration_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_bottom_nav_bar_screen/view/o_bottom_nav_bar_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_home_screen/owner_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusOwnerLoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final userFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginPageState = Provider.of<BusOwnerLoginScreenController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 50),
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: Image.asset(ImageConstants.loginRegistrationPng)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Bus Owner Login",
                    style: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(children: [
                  ///First Widget for owners email address
                  ReusableTextFieldWidget(
                    validator: (value) {
                      if (emailController.text.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter a valid user name";
                      }
                    },
                    formKey: userFormKey,
                    name: "Email Address",
                    prefixIcon: const Icon(Icons.email),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  ///Second Widget for Owner password
                  ReusableTextFieldWidget(
                    formKey: passwordFormKey,
                    validator: (value) {
                      if (passController.text.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter your password";
                      }
                    },
                    name: "Password",
                    prefixIcon: const Icon(Icons.password),
                    controller: passController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OBottomNavBarScreen()));
                        },
                        child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 25)),
                      )),
                  const SizedBox(
                    height: 30,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BusOwnerRegistrationScreen()));
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "Don't have an account ", style: TextStyle(fontSize: 15, color: Colors.black)),
                      TextSpan(
                          text: "Register",
                          style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold))
                    ])),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//commit