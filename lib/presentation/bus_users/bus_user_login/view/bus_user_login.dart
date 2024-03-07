import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_user_login/controller/bus_user_controller.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_user_registration/view/bus_user_registration.dart';
import 'package:bus_tracking_application/presentation/bus_users/user_home_screen/view/user_home_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusUserLogin extends StatefulWidget {
  BusUserLogin({super.key});

  @override
  State<BusUserLogin> createState() => _BusUserLoginState();
}

class _BusUserLoginState extends State<BusUserLogin> {
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  var userNameFormKey = GlobalKey<FormState>();
  var passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginPageState = Provider.of<LoginScreenController>(context);
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
                Center(
                  child: Column(
                    children: [
                      //first widget
                      ReusableTextFieldWidget(
                        formKey: userNameFormKey,
                        prefixIcon: const Icon(Icons.email,
                            color: ColorConstants.iconBlue),
                        name: "User Name",
                        controller: userNameController,
                        validator: (p0) {
                          if (userNameController.text.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter a valid user name";
                          }
                        },
                      ),
                      //second widget for password

                      ReusableTextFieldWidget(
                        formKey: passwordFormKey,
                        prefixIcon: const Icon(Icons.password,
                            color: ColorConstants.iconBlue),
                        name: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (p0) {
                          if (passwordController.text.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter your password";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //third widget
                loginPageState.isLoading
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
                            if (userNameFormKey.currentState!.validate() &&
                                passwordFormKey.currentState!.validate()) {
                              Provider.of<LoginScreenController>(context,
                                      listen: false)
                                  .onLogin(
                                userName: userNameController.text,
                                password: passwordController.text,
                              )
                                  .then((value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserHomeScreen(),
                                      ),
                                      (route) => false);
                                }
                              });
                            }
                          },
                          child: const Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BusUserRegistration()));
                    },
                    child: Text(
                      "Don't have an account?Register Here!!",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
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
