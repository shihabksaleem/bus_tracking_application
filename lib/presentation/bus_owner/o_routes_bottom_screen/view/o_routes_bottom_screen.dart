import 'package:bus_tracking_application/presentation/bus_owner/buses_assigned_screen/view/buses_assigned_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_routes_bottom_screen/controller/o_routes_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/custom_drop_down_widget/view/custom_drop_down_butto.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';

class ORoutesBottomScreen extends StatefulWidget {
  const ORoutesBottomScreen({super.key});

  @override
  State<ORoutesBottomScreen> createState() => _ORoutesBottomScreenState();
}

class _ORoutesBottomScreenState extends State<ORoutesBottomScreen> {
  // Initial Value
  String? busNameDropdownValue;
  String? driverNameDropdownValue;
  TimeOfDay currentTime = TimeOfDay.now();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ORoutesBottomScreenControlller>(context, listen: false)
          .getBusList();
      await Provider.of<ORoutesBottomScreenControlller>(context, listen: false)
          .getRoutesList();
    });
    super.initState();
  }

  //  dropdown menu items
  var busName = [
    'busName 1',
    'busName 2',
    'busName 3',
    'busName 4',
    'busName 5',
  ];
  var driverName = [
    'driverName 1',
    'driverName 2',
    'driverName 3',
    'driverName 4',
    'driverName 5',
  ];

  @override
  Widget build(BuildContext context) {
    final routesScreenState =
        Provider.of<ORoutesBottomScreenControlller>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Available Routes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        body: routesScreenState.isLoading
            ? Center(
                child: ReusableLoadingWidget(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount:
                        routesScreenState.routesListResModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BusesAssignedScreen(),
                                ));
                          },
                          child: Card(
                              color: Color(0xFFB2DFDB),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      routesScreenState.routesListResModel
                                              ?.data?[index].startsFrom!
                                              .toUpperCase() ??
                                          "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Wrap(
                                      children: List.generate(5, (dotindex) {
                                        return Container(
                                          margin: const EdgeInsets.all(4),
                                          width: 4,
                                          height: 4,
                                          color: ColorConstants.mainWhite,
                                          child: const DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.white)),
                                        );
                                      }),
                                    ),
                                    Text(
                                      routesScreenState.routesListResModel
                                              ?.data?[index].endsAt!
                                              .toUpperCase() ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: assignBuses,
                                        icon: const Icon(
                                          Icons.add_circle_sharp,
                                          size: 30,
                                          color: ColorConstants.mainWhite,
                                        ))
                                  ],
                                ),
                              )),
                        ),
                      );
                    }),
              ),
      ),
    );
  }

  //for timing
  Future<void> selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    if (time != null) {
      setState(() {
        currentTime = time;
      });
    }
  }

  //for bottom sheet
  void assignBuses() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          final routesScreenState =
              Provider.of<ORoutesBottomScreenControlller>(context);
          return Container(
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            height: MediaQuery.of(context).size.height - 250,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select the Bus",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  CustomDropDownButton(
                    items: routesScreenState.bussesList ?? [],
                    value: routesScreenState.selectedBus,
                    onChanged: (p0) {},
                  ),
                  const Text(
                    "Select the Driver",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  CustomDropDownButton(
                    items: routesScreenState.driverList,
                    onChanged: (p0) {},
                    value: routesScreenState.selectedDriver,
                  ),
                  ReusableTextFieldWidget(
                    keyboardType: TextInputType.none,
                    name: "Start time",
                    controller: TextEditingController(
                        text: '${currentTime.hour}:${currentTime.minute}'),
                    onTap: selectTime,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                  ReusableTextFieldWidget(
                    name: "End time",
                    controller: TextEditingController(
                        text: '${currentTime.hour}:${currentTime.minute}'),
                    onTap: selectTime,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                ColorConstants.mainBlue,
                              ),
                              shape: MaterialStatePropertyAll(StadiumBorder())),
                          onPressed: () {},
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                                color: ColorConstants.mainWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                ColorConstants.mainBlue,
                              ),
                              shape: MaterialStatePropertyAll(StadiumBorder())),
                          onPressed: () {},
                          child: const Text("Cancel",
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontSize: 16))),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
