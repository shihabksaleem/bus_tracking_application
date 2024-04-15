import 'package:bus_tracking_application/presentation/admin/admin_bus_stops_screen/controller/admin_bus_stops_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminBusStopsScreen extends StatefulWidget {
  const AdminBusStopsScreen({super.key, required this.routeId});
  final String routeId;

  @override
  State<AdminBusStopsScreen> createState() => _AdminBusStopsScreenState();
}

class _AdminBusStopsScreenState extends State<AdminBusStopsScreen> {
  final stopNameController = TextEditingController();
  final timeController = TextEditingController();
  final costController = TextEditingController();
  final stopNameKey = GlobalKey<FormState>();
  final timeKey = GlobalKey<FormState>();
  final costKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context
          .read<AdminBusStopsScreenController>()
          .getBusRouteStops(routeId: widget.routeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final porvider = context.watch<AdminBusStopsScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          porvider.stopsRes?.route?.name.toString().toUpperCase() ?? "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: porvider.isLoading
          ? Center(
              child: ReusableLoadingWidget(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Available Bus Stops",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context
                          .read<AdminBusStopsScreenController>()
                          .getBusRouteStops(routeId: widget.routeId);
                    },
                    child: porvider.stopsRes?.route?.stops?.length == 0 ||
                            porvider.stopsRes?.route?.stops?.length == null
                        ? Center(
                            child: Text("No Stops Added"),
                          )
                        : ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount:
                                porvider.stopsRes?.route?.stops?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    "Stop Name: ${porvider.stopsRes?.route?.stops?[index].stopName?.toUpperCase()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Time Taken: ${porvider.stopsRes?.route?.stops?[index].timeTaken}"),
                                      Text(
                                          "Approximate Cost: Rs 2${porvider.stopsRes?.route?.stops?[index].approxCost}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet_AddBustop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet_AddBustop(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 10.0,
              right: 10,
              top: 25,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ///first textfield for source input
              // ReusableTextFieldWidget(
              //   name: "Stop Name:",
              //   keyboardType: TextInputType.text,
              //   // controller: sourceController,
              // ),
              // ReusableTextFieldWidget(
              //   name: "Time Taken:",
              //   keyboardType: TextInputType.text,
              //   // controller: destinationController,
              // ),
              // ReusableTextFieldWidget(
              //   name: "Approximate Cost:",
              //   keyboardType: TextInputType.text,
              //   // controller: destinationController,
              // ),
              ReusableTextFieldWidget(
                formKey: stopNameKey,
                name: "Stop Name:",
                keyboardType: TextInputType.text,
                controller: stopNameController,
                validator: (p0) {
                  if (stopNameController.text.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter Route name";
                  }
                },
              ),
              ReusableTextFieldWidget(
                formKey: timeKey,
                name: "Time Taken: ",
                hinttext: "hh:mm:ss",
                keyboardType: TextInputType.text,
                controller: timeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter time";
                  }
                  // Regular expression to match the time format: hh:mm[:ss[.uuuuuu]]
                  RegExp regex = RegExp(
                    r'^([01]\d|2[0-3]):([0-5]\d)(:[0-5]\d)?(\.\d{1,6})?$',
                  );

                  // Check if the entered value matches the pattern
                  if (regex.hasMatch(value)) {
                    return null; // Valid time format
                  } else {
                    return 'Time has wrong format. Use one of these formats instead: hh:mm[:ss[.uuuuuu]]';
                  }
                },
              ),
              ReusableTextFieldWidget(
                formKey: costKey,
                name: "Approximate Cost:",
                keyboardType:
                    TextInputType.number, // Change the keyboard type to number
                controller: costController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter a value";
                  }
                  // Use try-catch to attempt to parse the value as a double
                  try {
                    double cost = double.parse(value);
                    if (cost <= 0) {
                      return "Cost must be greater than 0";
                    }
                  } catch (e) {
                    return "Enter a valid number";
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      if (stopNameKey.currentState!.validate() &&
                          timeKey.currentState!.validate() &&
                          costKey.currentState!.validate()) {
                        Navigator.pop(context);
                        await context
                            .read<AdminBusStopsScreenController>()
                            .addNewRoute(
                                name: stopNameController.text.trim(),
                                cost: costController.text.trim(),
                                time: timeController.text.trim(),
                                routeId: widget.routeId)
                            .then((value) {
                          if (value) {
                            stopNameController.clear();
                            timeController.clear();
                            costController.clear();
                          }
                        });
                      }
                    },
                    shape: StadiumBorder(),
                    color: Colors.green,
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      stopNameController.clear();
                      timeController.clear();
                      costController.clear();
                      Navigator.pop(context);
                    },
                    shape: StadiumBorder(),
                    color: Colors.red,
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
