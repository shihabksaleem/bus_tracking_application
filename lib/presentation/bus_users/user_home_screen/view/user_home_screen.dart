import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:flutter/cupertino.dart';
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
            ),
            Spacer(),

            //#2 Sujested locations

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: ColorConstants.mainWhite,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.message, color: Colors.green),
                            SizedBox(width: 20),
                            Text("Location")
                          ],
                        ),
                        SizedBox(height: 20),
                        Text("2 km")
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    ));
  }
}
