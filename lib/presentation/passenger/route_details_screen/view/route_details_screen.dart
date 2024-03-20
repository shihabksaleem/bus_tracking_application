// ignore_for_file: prefer_const_constructors

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/passenger/passenger_home_screen/view/passenger_home_screen.dart';
import 'package:bus_tracking_application/presentation/passenger/route_details_screen/controller/route_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bus_tracking_screen/view/bus_tracking_screen.dart';

class RouteDetailsScreen extends StatefulWidget {
  const RouteDetailsScreen({
    super.key,
    required this.routeId,
  });

  final String routeId;

  @override
  State<RouteDetailsScreen> createState() => _RouteDetailsScreenState();
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RouteDetailsScreenController>(context, listen: false)
          .getRoutesDetails(routeId: widget.routeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeDetailsScreenState =
        Provider.of<RouteDetailsScreenController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const PassengerHomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            routeDetailsScreenState
                    .routeAndBusDetailsResModel?.routeDetails?.name
                    ?.toUpperCase() ??
                "",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Wrap(
              children: [
                Text("",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.iconBlue)),
                const Icon(Icons.directions_walk,
                    color: ColorConstants.iconBlue)
              ],
            ),
          ],
        ),
        body: routeDetailsScreenState.isLoading
            ? Center(
                child: ReusableLoadingWidget(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  //first widget to show the map
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(ImageConstants.mapSampleImageJpg),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.mainBlack.withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //second widget
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.6,
                              color:
                                  ColorConstants.mainBlack.withOpacity(0.4))),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Buses Approaching",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.mainBlack)),
                    ),
                  ),
                  //third widget to show the suggested bus
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                          routeDetailsScreenState.asignedBusList.length,
                          (index) => ListTile(
                            leading: Icon(Icons.directions_bus,
                                color: ColorConstants.iconBlue),
                            title: Text(
                                routeDetailsScreenState
                                        .asignedBusList[index].bus?.name
                                        ?.toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.mainBlack)),
                            subtitle: Text(
                              routeDetailsScreenState.routeAndBusDetailsResModel
                                      ?.routeDetails?.name
                                      ?.toUpperCase() ??
                                  "",
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  routeDetailsScreenState
                                          .asignedBusList[index].startTime
                                          ?.toString() ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BusTrackingScreen(
                                                    busName:
                                                        routeDetailsScreenState
                                                                .asignedBusList[
                                                                    index]
                                                                .bus
                                                                ?.name
                                                                ?.toString() ??
                                                            "",
                                                    routeId: widget.routeId,
                                                  )));
                                    },
                                    icon: const Icon(Icons.arrow_forward))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
