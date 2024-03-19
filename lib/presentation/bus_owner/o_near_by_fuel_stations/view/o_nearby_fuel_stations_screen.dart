import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ONearbyFuelStations extends StatefulWidget {
  const ONearbyFuelStations({super.key});

  @override
  State<ONearbyFuelStations> createState() => _ONearbyFuelStationsState();
}

class _ONearbyFuelStationsState extends State<ONearbyFuelStations> {
  List<Map<String, String>> fulStations = [
    {"brand": "ABC Fuel", "location": "Kochi, Kerala"},
    {"brand": "XYZ Petroleum", "location": "Trivandrum, Kerala"},
    {"brand": "FuelMart", "location": "Kozhikode, Kerala"},
    // Add more stations as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuel Stations"),
      ),
      body: ListView.builder(
        itemCount: fulStations.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(ImageConstants.fuelStationPng)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fulStations[index]['brand'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(fulStations[index]['location'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () async {
                      const url =
                          'https://maps.app.goo.gl/sSzKESoBaQCfXSLy5?g_st=ic';
                      print(url);
                      await launchUrl(
                          mode: LaunchMode.externalApplication, Uri.parse(url));
                    },
                    icon: Column(
                      children: [
                        Icon(Icons.map, color: ColorConstants.iconBlue),
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
    );
  }
}
