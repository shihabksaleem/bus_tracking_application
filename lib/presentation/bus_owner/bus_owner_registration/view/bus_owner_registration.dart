import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/bus_owner_login/view/bus_owner_login.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(home: BusOwnerRegistration(),));
}

class BusOwnerRegistration extends StatelessWidget{

  final ownerController = TextEditingController();
  final emailController = TextEditingController();
  final passController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12,top: 50),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(ImageConstants.loginRegistrationPng)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Bus Owner Registration",
                    style: GoogleFonts.roboto(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  )
              ),
              SizedBox(height: 30,),

              Center(
                child: Column(
                  children :[

                ///First widget for owner name
                ReusableTextFieldWidget(
                  name: "Owner Name",
                prefixIcon: Icon(Icons.person),
                  controller:ownerController ,
                  keyboardType: TextInputType.text,
                ),

                ///Second Widget for owners email address
                ReusableTextFieldWidget(name: "Email Address",
                prefixIcon: Icon(Icons.email),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                ///Third Widget for Owner password
                ReusableTextFieldWidget(name: "Password",
                prefixIcon: Icon(Icons.password),
                  controller: passController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),

                SizedBox(height: 30,),

                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child:  ElevatedButton(
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
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BusOwnerLogin()));
                  },
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Already have an account ",style: TextStyle(fontSize: 15, color: Colors.black)),
                      TextSpan(text: "Login",style: TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold))
                    ]
                  )),
                ),
                          ]

                ),
              )



            ],
          ),
        ),
      ),
    );
  }


}