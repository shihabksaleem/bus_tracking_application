import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../admin_registration/view/admin_registration_screen.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(ImageConstants.loginRegistrationPng)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome Admin ",
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
                      //first widget
                      ReusableTextFieldWidget(
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.blue),
                          name: "Email Address",
                          controller: userNameController,
                          keyboardType: TextInputType.emailAddress),
                      //second widget for password

                      ReusableTextFieldWidget(
                        prefixIcon:
                            const Icon(Icons.password, color: Colors.blue),
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
                //third widget
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
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdminRegistration()));
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        )
                      ]))

                      // Text(
                      //   "Don't have an account?Register Here!!",
                      //   style: TextStyle(fontSize: 15, color: Colors.black),
                      // ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}