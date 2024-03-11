import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/passenger/route_details_screen/controller/route_details_screen_controller.dart';
import 'package:bus_tracking_application/repository/api/passenger/route_details_screen/models/route_and_bus_details_res_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';

class BusTrackingScreen extends StatefulWidget {
  const BusTrackingScreen({super.key, required this.routeId, required this.busName});

  final String routeId;
  final String busName;

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RouteDetailsScreenController>(context, listen: false).getRoutesDetails(routeId: widget.routeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeDetailsScreenState = Provider.of<RouteDetailsScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(widget.busName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.mainBlack)),
      ),
      body: routeDetailsScreenState.isLoading
          ? Center(
              child: ReusableLoadingWidget(),
            )
          : Column(
              children: [
                //first widget to show the map
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConstants.mapSampleImageJpg), fit: BoxFit.cover),
                  ),
                ),
                //second widget
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.6, color: ColorConstants.mainBlack.withOpacity(0.4))),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bus Route",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: ColorConstants.mainBlack)),
                  ),
                ),
                //third widget using Timeline tile
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          routeDetailsScreenState.routeAndBusDetailsResModel?.routeDetails?.stopsList?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(height: 90, child: TimeLineWidget(index))),
                ),
              ],
            ),
    );
  }

  Widget TimeLineWidget(
    int index,
  ) {
    final routeDetailsScreenState = Provider.of<RouteDetailsScreenController>(context);

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
          routeDetailsScreenState.routeAndBusDetailsResModel?.routeDetails?.stopsList?[index].timeTaken ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
            color: ColorConstants.mainBlack,
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(routeDetailsScreenState.routeAndBusDetailsResModel?.routeDetails?.stopsList?[index].stopName ?? "",
            style: TextStyle(
              color: index == 0 ? Colors.grey : ColorConstants.iconBlue,
            )),
      ),
    );
  }
}
