import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.mapSampleImageJpg,
                ),
                fit: BoxFit.cover)),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //#1 search widget
            TextFormField(
              decoration: InputDecoration(
                  fillColor: ColorConstants.mainWhite,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            )
          ],
        ),
      ),
    ));
  }
}
