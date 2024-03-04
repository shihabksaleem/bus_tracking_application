// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/user_home_screen/view/widget/home_screen_busses_card.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_drawer_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../route_details_screen/view/route_details_screen.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});
  final String name = "Location";
  final String distance = "1 Km(2 min)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "",
        )),
        drawer: ReusableDrawerWidget(
          name: 'name',
          email: 'email',
          drawerItems: [
            DrawerItem(
                icon: Icons.bus_alert, title: 'Nearby bus stops', onTap: () {}),
            DrawerItem(
                icon: Icons.directions_bus,
                title: 'Track my bus',
                onTap: () {}),
            DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),
            DrawerItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Terms & Condition',
                onTap: () {}),
            DrawerItem(
                icon: Icons.power_settings_new, title: 'Logout', onTap: () {}),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstants.mapSampleImageJpg,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                //#1 search widget
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(4, 6),
                              blurRadius: 8,
                              color: ColorConstants.mainBlack.withOpacity(.5))
                        ]),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "From",
                              fillColor: ColorConstants.mainWhite,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: Colors.blue,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "To",
                              fillColor: ColorConstants.mainWhite,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: Colors.blue,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              10, (index) => HomeScreenBussesCard()),
                        ),
                      ),
                    ),
                  ),
                ),

                //#2 Sujested locations

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => RouteDetailsScreen(
                                        name: name,
                                        timing: distance,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 6),
                                    blurRadius: 8,
                                    color: ColorConstants.mainBlack
                                        .withOpacity(.5))
                              ]),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.message, color: Colors.green),
                                  SizedBox(width: 20),
                                  Text(name)
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(distance)
                            ],
                          ),
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
