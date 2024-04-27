import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_buses_assigned_screen/controller/o_busses_assigned_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OBusesAssignedScreen extends StatefulWidget {
  const OBusesAssignedScreen({super.key, required this.routeId});

  final String routeId;

  @override
  State<OBusesAssignedScreen> createState() => _OBusesAssignedScreenState();
}

class _OBusesAssignedScreenState extends State<OBusesAssignedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<OBussesAssignedScreenController>(context, listen: false)
          .getAssignedBusses(routeId: widget.routeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Buses Assigned",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          body: Consumer<OBussesAssignedScreenController>(
            builder: (context, value, child) => value.isLoading
                ? Center(
                    child: ReusableLoadingWidget(),
                  )
                : value.assignedBusList.isEmpty
                    ? Center(
                        child: Text("No Busses Assigned"),
                      )
                    : ListView.builder(
                        itemCount: value.assignedBusList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: ColorConstants.mainLightBlue,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Image.asset(ImageConstants.busesPng),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              value.assignedBusList[index].route
                                                      ?.name
                                                      .toString()
                                                      .toUpperCase() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Bus name: ${value.assignedBusList[index].bus?.name.toString() ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          // Text(
                                          //     "Driver name: ${value.assignedBusList[index].?.name.toString() ?? ""}",
                                          //     style: TextStyle(
                                          //         fontSize: 18, fontWeight: FontWeight.bold)),
                                          Text(
                                              "Starting time: ${value.assignedBusList[index].startTime.toString() ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Ending time: ${value.assignedBusList[index].endTime.toString() ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 186, 103, 97),
                                        child: IconButton(
                                            onPressed: () async {
                                              //Todo:delete

                                              await context
                                                  .read<
                                                      OBussesAssignedScreenController>()
                                                  .delteAssignedBus(
                                                      busId: value
                                                          .assignedBusList[
                                                              index]
                                                          .id
                                                          .toString(),
                                                      routeId: widget.routeId);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
          )),
    );
  }
}
