// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_home_screen/controller/passenger_home_screen_controller.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_home_screen/view/widget/passenger_home_screen_busses_card.dart';
import 'package:bus_tracking_application/presentation/common_screen/get_started_screen/view/get_started_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_drawer_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/passenger/terms_and_conditions_screen/view/terms_and_conditions_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route_details_screen/view/route_details_screen.dart';

class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  State<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  TextEditingController startsFromController = TextEditingController();
  TextEditingController endsAtController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PassengerHomeScreenController>(context, listen: false)
          .getRoutesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userHomeScreenState =
        Provider.of<PassengerHomeScreenController>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "",
        )),
        drawer: ReusableDrawerWidget(
          name: '',
          email: '',
          drawerItems: [
            DrawerItem(
                icon: Icons.sos,
                title: 'Emergency button',
                onTap: () {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      content: Text(
                          "Are you sure you want to sent an alert message"),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text("NO"),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);

                            await Provider.of<PassengerHomeScreenController>(
                                    context,
                                    listen: false)
                                .sendAlert()
                                .then((value) {
                              if (value) {
                                AppUtils.oneTimeSnackBar(
                                    bgColor: ColorConstants.mainGreen,
                                    "SOS message sent successfully!",
                                    context: context);
                              } else {
                                AppUtils.oneTimeSnackBar(
                                    "Failed to send SOS message ",
                                    context: context);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text("YES"),
                          ),
                        )
                      ],
                    ),
                  );
                },
                iconColor: ColorConstants.mainRed),
            // DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),
            DrawerItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Terms & Condition',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsAndConditionsScreen(),
                      ));
                }),
            DrawerItem(
                icon: Icons.power_settings_new,
                title: 'Logout',
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetStartedScreen(),
                      ),
                      (route) => false);
                }),
          ],
        ),
        body: userHomeScreenState.isLoading
            ? Center(
                child: ReusableLoadingWidget(),
              )
            : SafeArea(
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
                                    color: ColorConstants.mainBlack
                                        .withOpacity(.5))
                              ]),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: startsFromController,
                                decoration: InputDecoration(
                                    hintText: "From",
                                    fillColor: ColorConstants.mainWhite,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                      color: ColorConstants.iconBlue,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: endsAtController,
                                decoration: InputDecoration(
                                    hintText: "To",
                                    fillColor: ColorConstants.mainWhite,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                      color: ColorConstants.iconBlue,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Provider.of<PassengerHomeScreenController>(context,
                                  listen: false)
                              .getSearchResult(
                            startingPoint: startsFromController.text.trim(),
                            endPoint: endsAtController.text.trim(),
                          );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorConstants.mainBlue,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                                child: Text(
                              "Search",
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: RefreshIndicator(
                              onRefresh: () async {
                                Provider.of<PassengerHomeScreenController>(
                                        context,
                                        listen: false)
                                    .getRoutesList();
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                      userHomeScreenState.searchResultResModel
                                              ?.buses?.length ??
                                          0,
                                      (index) => PassengerHomeScreenBussesCard(
                                            routeId: userHomeScreenState
                                                    .searchResultResModel
                                                    ?.buses?[index]
                                                    .routeAssignments?[0]
                                                    .routeId // Todo: route id need to be changed
                                                    .toString() ??
                                                "",
                                            imagePath: userHomeScreenState
                                                    .searchResultResModel
                                                    ?.buses?[index]
                                                    .image
                                                    .toString() ??
                                                "",
                                            name: userHomeScreenState
                                                    .searchResultResModel
                                                    ?.buses?[index]
                                                    .name
                                                    .toString() ??
                                                "",
                                            busNumber: userHomeScreenState
                                                    .searchResultResModel
                                                    ?.buses?[index]
                                                    .numberPlate
                                                    .toString() ??
                                                "",
                                            busRoute: userHomeScreenState
                                                    .searchResultResModel
                                                    ?.buses?[index]
                                                    .isActive
                                                    .toString() ??
                                                "",
                                          )),
                                ),
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
                          userHomeScreenState
                                  .routesListResModel?.routesList?.length ??
                              0,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RouteDetailsScreen(
                                              routeId: userHomeScreenState
                                                      .routesListResModel
                                                      ?.routesList?[index]
                                                      .id ??
                                                  "",
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
                                        Icon(Icons.message,
                                            color: Colors.green),
                                        SizedBox(width: 20),
                                        Text(userHomeScreenState
                                                .routesListResModel
                                                ?.routesList?[index]
                                                .name ??
                                            "")
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(userHomeScreenState.routesListResModel
                                                ?.routesList?[index].isActive ==
                                            true
                                        ? "Active"
                                        : "Inactive")
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
