import 'package:bus_tracking_application/presentation/admin/admin_bus_route_bottom_tab/controller/admin_bus_route_bottom_tab_controller.dart';
import 'package:bus_tracking_application/presentation/admin/admin_bus_stop/view/admin_bus_Stop.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminBusRouteBottomTab extends StatefulWidget {
  const AdminBusRouteBottomTab({super.key});

  @override
  State<AdminBusRouteBottomTab> createState() => _AdminBusRouteBottomTabState();
}

class _AdminBusRouteBottomTabState extends State<AdminBusRouteBottomTab> {
  final sourceController = TextEditingController();
  final routeNameController = TextEditingController();

  final destinationController = TextEditingController();
  final sourceKey = GlobalKey<FormState>();
  final destiKey = GlobalKey<FormState>();
  final routenameKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<AdminRoutesBottomTabController>().getRoutesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdminRoutesBottomTabController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bus Routes Available",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Icon(Icons.add),
        ),
        body: provider.isLoading
            ? Center(
                child: ReusableLoadingWidget(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await context
                      .read<AdminRoutesBottomTabController>()
                      .getRoutesList();
                },
                child: ListView.builder(
                    itemCount: provider.routesListResModel?.route?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            "Name: ${provider.routesListResModel?.route?[index].name.toString().toUpperCase()}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "From: ${provider.routesListResModel?.route?[index].startsFrom.toString()}"),
                                Text(
                                    "To: ${provider.routesListResModel?.route?[index].endsAt.toString().toUpperCase()}"),
                              ]),
                          trailing: Wrap(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 130, 175, 212),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminBusStop()));
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // CircleAvatar(
                              //   backgroundColor:
                              //       Color.fromARGB(255, 186, 103, 97),
                              //   child: IconButton(
                              //       onPressed: () {},
                              //       icon: Icon(
                              //         Icons.delete,
                              //         color: Colors.white,
                              //       )),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///first textfield for source input
                ReusableTextFieldWidget(
                  formKey: routenameKey,
                  name: "Name",
                  keyboardType: TextInputType.text,
                  controller: routeNameController,
                  validator: (p0) {
                    if (routeNameController.text.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter Route name";
                    }
                  },
                ),
                ReusableTextFieldWidget(
                  formKey: sourceKey,
                  name: "From",
                  keyboardType: TextInputType.text,
                  controller: sourceController,
                  validator: (p0) {
                    if (sourceController.text.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter Place name";
                    }
                  },
                ),
                ReusableTextFieldWidget(
                  formKey: destiKey,
                  name: "To",
                  keyboardType: TextInputType.text,
                  controller: destinationController,
                  validator: (p0) {
                    if (destinationController.text.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter Place name";
                    }
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (routenameKey.currentState!.validate() &&
                            sourceKey.currentState!.validate() &&
                            destiKey.currentState!.validate()) {
                          Navigator.pop(context);
                          context
                              .read<AdminRoutesBottomTabController>()
                              .addNewRoute(
                                name: routeNameController.text.trim(),
                                from: sourceController.text.trim(),
                                to: destinationController.text.trim(),
                              )
                              .then((value) {
                            if (value == true) {
                              sourceController.clear();
                              destinationController.clear();
                              routeNameController.clear();
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
                        sourceController.clear();
                        destinationController.clear();
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
        });
  }
}
