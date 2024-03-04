import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../global_widgets/reusable_textfield_widget.dart';

import '../../admin_login/view/admin_login_screen.dart';


class AdminRegistration extends StatelessWidget {
  AdminRegistration({super.key});

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //   appBar: AppBar(leading: IconButton(onPressed:(){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
        // }, icon:  Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12,top: 50),
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
                          prefixIcon: const Icon(Icons.email, color: Colors.blue),
                          name: "User Name",
                          controller: userNameController,
                          keyboardType: TextInputType.emailAddress),

                      //second widget for Email Address
                      ReusableTextFieldWidget(
                          prefixIcon: const Icon(Icons.email, color: Colors.blue),
                          name: "Email Address",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress),

                      //Third widget for password
                      ReusableTextFieldWidget(
                        prefixIcon: const Icon(Icons.password, color: Colors.blue),
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
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(StadiumBorder())),
                      onPressed: () {},
                      child: const Text("Register",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AdminLogin()));
                    },
                    child: RichText(text: TextSpan(

                        children: [
                          TextSpan(text: "Already have an account?",style: TextStyle(fontSize: 15, color: Colors.black),),
                          TextSpan(text: " Login",style: TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold),)
                        ]
                    ))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
