import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';

class BusTrackingScreen extends StatelessWidget {
  const BusTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Bus number & name",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorConstants.mainBlack)),
      ),
      body: Column(
        children: [
          //first widget to show the map
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.mapSampleImageJpg),
                  fit: BoxFit.cover),
            ),
          ),
          //second widget
          Container(
            padding: const EdgeInsets.all(12),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 0.6,
                      color: ColorConstants.mainBlack.withOpacity(0.4))),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Bus Route",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.mainBlack)),
            ),
          ),
          //third widget using Timeline tile
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    SizedBox(height: 90, child: TimeLineWidget(index))),
          ),
        ],
      ),
    );
  }

  Widget TimeLineWidget(int index) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      isFirst: index == 0 ? true : false,
      isLast: index == 3 ? true : false,
      indicatorStyle: IndicatorStyle(
          width: 40,
          height: 30,
          color: index == 0 ? Colors.grey : ColorConstants.iconBlue,
          iconStyle: IconStyle(iconData: Icons.directions_bus)),
      afterLineStyle: const LineStyle(
        thickness: 2,
        color: Colors.grey,
      ),
      beforeLineStyle: const LineStyle(
        thickness: 2,
        color: Colors.red,
      ),
      startChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          "12:06 pm",
          style: TextStyle(
            fontSize: 16,
            fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
            color: ColorConstants.mainBlack,
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text("Bus route name",
            style: TextStyle(
              color: index == 0 ? Colors.grey : ColorConstants.iconBlue,
            )),
      ),
    );
  }
}
