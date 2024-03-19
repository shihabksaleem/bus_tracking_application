import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_near_by_workshops/controller/o_near_by_fuel_stations_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ONearbyWorkshops extends StatefulWidget {
  const ONearbyWorkshops({super.key});

  @override
  State<ONearbyWorkshops> createState() => _ONearbyWorkshopsState();
}

class _ONearbyWorkshopsState extends State<ONearbyWorkshops> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ONearbyWorkShopsScreenController>(context,
              listen: false)
          .getWorkShops(placeName: "kakkanad");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Work shops"),
        ),
        body: Consumer<ONearbyWorkShopsScreenController>(
          builder: (context, value, child) => value.isLoading
              ? Center(
                  child: ReusableLoadingWidget(),
                )
              : ListView.builder(
                  itemCount: value.workShpsList.length,
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
                                color: ColorConstants.mainBlack.withOpacity(.3),
                                blurRadius: 6)
                          ]),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(ImageConstants.workShopPng)),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.workShpsList[index].displayName
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          IconButton(
                              onPressed: () async {
                                const url =
                                    'https://maps.app.goo.gl/mgzWMPKo5CmwPi7p7?g_st=ic';
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
        ));
  }
}
