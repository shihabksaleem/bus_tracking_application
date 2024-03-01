import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTextFieldWidget extends StatelessWidget {
  ReusableTextFieldWidget(
      {super.key,
      required this.name,
      required this.controller,
      this.icon,
      this.isObscure = false,
      required this.textInputType,
      this.useNoBorder = false});

  TextEditingController controller;
  final String name;
  final Icon? icon;
  final bool isObscure;
  final TextInputType textInputType;
  final bool useNoBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
      controller: controller,
      obscureText: isObscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: useNoBorder ? InputBorder.none : null,
        contentPadding: const EdgeInsets.all(8),
        label: Text(name),
        prefixIcon: icon,
      ),
    );
  }
}
