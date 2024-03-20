import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_fuel_stations/controller/o_near_by_fuel_stations_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ONearbyFuelStations extends StatefulWidget {
  const ONearbyFuelStations({super.key});

  @override
  State<ONearbyFuelStations> createState() => _ONearbyFuelStationsState();
}

class _ONearbyFuelStationsState extends State<ONearbyFuelStations> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ONearbyFuelStationsScreenController>(context,
              listen: false)
          .getFuelStations(placeName: "Aluva");
    });
    super.initState();
  }

  TextEditingController serchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerState =
        Provider.of<ONearbyFuelStationsScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuel Stations"),
      ),
      body: providerState.isLoading
          ? Center(
              child: ReusableLoadingWidget(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ReusableTextFieldWidget(
                    controller: serchController,
                    name: "Enter Location",
                    suffix: Container(
                      color: ColorConstants.iconBlue,
                      child: IconButton(
                          color: ColorConstants.mainWhite,
                          onPressed: () async {
                            if (serchController.text.trim().isNotEmpty) {
                              await Provider.of<
                                          ONearbyFuelStationsScreenController>(
                                      context,
                                      listen: false)
                                  .getFuelStations(placeName: "Aluva");
                            } else {
                              AppUtils.oneTimeSnackBar("Enter a valid location",
                                  context: context);
                            }
                          },
                          icon: Icon(Icons.search)),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: providerState.fuelStationList.length,
                      itemBuilder: (context, index) => Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorConstants.mainLightBlue,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 6),
                                    color: ColorConstants.mainBlack
                                        .withOpacity(.3),
                                    blurRadius: 6)
                              ]),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                      ImageConstants.fuelStationPng)),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        providerState
                                            .fuelStationList[index].displayName
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    // Text(
                                    //     providerState.fuelStationList[index].address?.city
                                    //             .toString() ??
                                    //         "",
                                    //     style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                  onPressed: () async {
                                    const url =
                                        'https://maps.app.goo.gl/sSzKESoBaQCfXSLy5?g_st=ic';
                                    print(url);
                                    await launchUrl(
                                        mode: LaunchMode.externalApplication,
                                        Uri.parse(url));
                                  },
                                  icon: Column(
                                    children: [
                                      Icon(Icons.map,
                                          color: ColorConstants.iconBlue),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Go",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorConstants.iconBlue),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
