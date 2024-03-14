import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/admin/admin_registration/controller/admin_registration_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../global_widgets/reusable_textfield_widget.dart';

import '../../admin_login/view/admin_login_screen.dart';

class AdminRegistration extends StatefulWidget {
  AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //form keys
  final userNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final regScreenController =
        Provider.of<AdminRegistrationScreenController>(context);
    return SafeArea(
      child: Scaffold(
        //   appBar: AppBar(leading: IconButton(onPressed:(){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
        // }, icon:  Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 50),
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
                    "Admin Registration",
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
                      //first widget for username
                      ReusableTextFieldWidget(
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blue),
                        name: "User Name",
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

                      //second widget for Email Address
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.email, color: Colors.blue),
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
                      ),

                      //Third widget for password
                      ReusableTextFieldWidget(
                        prefixIcon:
                            const Icon(Icons.password, color: Colors.blue),
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
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //fourth widget
                regScreenController.isLoading
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
                            // validate all form keys
                            if (userNameFormKey.currentState!.validate() &&
                                emailFormKey.currentState!.validate() &&
                                passwordFormKey.currentState!.validate()) {
                              Provider.of<AdminRegistrationScreenController>(
                                      context,
                                      listen: false)
                                  .onRegister(
                                      userName: userNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                if (value) {
                                  AppUtils.oneTimeSnackBar(
                                    "Registration Success",
                                    context: context,
                                    bgColor: ColorConstants.mainGreen,
                                  );
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminLoginScreen(),
                                      ),
                                      (route) => false);
                                }
                              });
                            }
                          },
                          child: const Text("Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ),
                      ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AdminLoginScreen()));
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: " Login",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )
                    ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
