import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.bustrackingImgJpg),
            SizedBox(height: 10),
            Text(
              "Login As",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.yellow,
                    child: Center(child: Text("user 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.red,
                    child: Center(child: Text("user 1")),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.yellow,
              child: Center(child: Text("user 1")),
            ),
          ],
        ),
      ),
    );
  }
}
