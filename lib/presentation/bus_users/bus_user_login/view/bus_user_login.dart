import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_user_registration/bus_user_registration.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BusUserLogin(),
  ));
}

class BusUserLogin extends StatelessWidget {
  BusUserLogin({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(ImageConstants.loginRegistrationPng)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome to \nBustapp ",
                    style: GoogleFonts.roboto(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 135,
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
                            name: "Email Address",
                            controller: userNameController,
                            textInputType: TextInputType.emailAddress),
                        //second widget for password

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
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => BusUserRegistration()));
                  }, child: Text(
                    "Don't have an account?Register Here!!",
                    style: TextStyle(fontSize: 15,color: Colors.black),
                  ),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
