import 'package:bus_tracking_application/presentation/bus_users/bus_user_login/view/bus_user_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/image_constants.dart';
import '../../global_widgets/reusable_textfield_widget.dart';

class BusUserRegistration extends StatelessWidget {
  BusUserRegistration({super.key});

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(leading: IconButton(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BusUserLogin()));
      }, icon:  Icon(Icons.arrow_back))),
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
                    style: GoogleFonts.roboto(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          width: 1.5, color: Colors.black.withOpacity(1.0))),
                  child: Center(
                    child: Column(
                      children: [
                        //first widget
                        ReusableTextFieldWidget(
                            icon: const Icon(Icons.email, color: Colors.blue),
                            name: "UserName",
                            controller: userNameController,
                            textInputType: TextInputType.emailAddress),
                        //second widget
                        ReusableTextFieldWidget(
                            icon: const Icon(Icons.email, color: Colors.blue),
                            name: "Email Address",
                            controller: emailController,
                            textInputType: TextInputType.emailAddress),
                        //Third widget

                        ReusableTextFieldWidget(
                          icon: const Icon(Icons.password, color: Colors.blue),
                          name: "Password",
                          controller: passwordController,
                          textInputType: TextInputType.number,
                          isObscure: true,
                          useNoBorder: true,
                        ),
                      ],
                    ),
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
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(StadiumBorder())),
                      onPressed: () {},
                      child: const Text("Continue",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
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
