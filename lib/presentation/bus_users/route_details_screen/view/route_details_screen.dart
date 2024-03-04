import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/user_home_screen/view/user_home_screen.dart';
import 'package:flutter/material.dart';
import '../../bus_tracking_screen/view/bus_tracking_screen.dart';

class RouteDetailsScreen extends StatelessWidget {
  const RouteDetailsScreen(
      {super.key, required this.name, required this.timing});

  final String name;
  final String timing;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const UserHomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Wrap(
              children: [
                Text(timing,
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
        body: Column(
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
                      offset: const Offset(0, 4), // changes position of shadow
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
                        color: ColorConstants.mainBlack.withOpacity(0.4))),
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
                    3,
                    (index) => ListTile(
                      leading: const Icon(Icons.directions_bus,
                          color: ColorConstants.iconBlue),
                      title: const Text("Bus number & name",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.mainBlack)),
                      subtitle: const Text("source to destination"),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "5 min",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BusTrackingScreen()));
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
