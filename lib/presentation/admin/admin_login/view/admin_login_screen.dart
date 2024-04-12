import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/admin/admin_home/view/admin_homscreen.dart';
import 'package:bus_tracking_application/presentation/admin/admin_login/controller/admin_login_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../admin_registration/view/admin_registration_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //form keys
  final userNameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginScreenController =
        Provider.of<AdminLoginScreenController>(context);
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
                    child: Image.asset(ImageConstants.busesPng)),
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
                        prefixIcon: const Icon(Icons.email, color: Colors.blue),
                        name: "Username",
                        controller: userNameController,
                        formKey: userNameFormKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (userNameController.text.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter a valid user name";
                          }
                        },
                      ),
                      //second widget for password

                      ReusableTextFieldWidget(
                        prefixIcon:
                            const Icon(Icons.password, color: Colors.blue),
                        name: "Password",
                        controller: passwordController,
                        formKey: passwordFormKey,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isNotEmpty) {
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
                loginScreenController.isLoading
                    ? const Center(child: ReusableLoadingWidget())
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
                              Provider.of<AdminLoginScreenController>(context,
                                      listen: false)
                                  .onAdminLogin(
                                userName: userNameController.text,
                                password: passwordController.text,
                              )
                                  .then((value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdminHomeScreen(),
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
