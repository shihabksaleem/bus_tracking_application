import 'package:bus_tracking_application/presentation/admin/admin_Request/view/admin_request.dart';
import 'package:bus_tracking_application/presentation/admin/admin_bus_route/view/admin_bus_route.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: admin_Homescreen(),
  ));
}

class admin_Homescreen extends StatefulWidget {
  @override
  State<admin_Homescreen> createState() => _admin_HomescreenState();
}

class _admin_HomescreenState extends State<admin_Homescreen> {
  int index = 0;
  List bottomscreens = [AdminBusRoute(), AdminRequest()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "ADMIN",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation_rounded),
            label: 'Bus Route',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote),
            label: 'Request',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        currentIndex: index,
      ),

      body: bottomscreens[index],
    );
  }
}
