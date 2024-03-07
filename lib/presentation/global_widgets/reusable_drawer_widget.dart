import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class ReusableDrawerWidget extends StatelessWidget {
  final List<DrawerItem> drawerItems;
  final String name;
  final String email;

  ReusableDrawerWidget(
      {required this.drawerItems, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DrawerHeader(
              child: Row(
            children: [
              Container(
                height: 90,
                width: 90,
                ///todo: image of the user
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(
                          ImageConstants.loginRegistrationPng,
                        ),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, spreadRadius: 0.1, blurRadius: 1)
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 45),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )),

          ///for loop for List tile items
          for (var item in drawerItems) buildListTile(item),
        ],
      ),
    );
  }

  Widget buildListTile(DrawerItem item) {
    return InkWell(
      onTap: item.onTap,
      child: ListTile(
        leading: Icon(item.icon, color: Colors.blue),
        title: Text(
          item.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;

  final VoidCallback onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
