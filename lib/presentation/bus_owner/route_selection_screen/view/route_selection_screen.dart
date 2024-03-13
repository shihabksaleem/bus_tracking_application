import 'package:bus_tracking_application/presentation/bus_owner/buses_assigned_screen/view/buses_assigned_screen.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/color_constants.dart';

void main() {
  runApp(const MaterialApp(
    home: RouteSelectionScreen(),
  ));
}

class RouteSelectionScreen extends StatefulWidget {
  const RouteSelectionScreen({super.key});

  @override
  State<RouteSelectionScreen> createState() => _RouteSelectionScreenState();
}

class _RouteSelectionScreenState extends State<RouteSelectionScreen> {
  // Initial Value
  String? busNameDropdownValue;
  String? driverNameDropdownValue;
  TimeOfDay currentTime = TimeOfDay.now();

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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    DropDownWidget(name: busName, value: busNameDropdownValue),
                    const Text(
                      "Select the Driver",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    DropDownWidget(
                      name: driverName,
                      value: driverNameDropdownValue,
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
                                shape:
                                    MaterialStatePropertyAll(StadiumBorder())),
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
                                shape:
                                    MaterialStatePropertyAll(StadiumBorder())),
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: const Text("Bus Route",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Container(
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
                    color:Color(0xFFB2DFDB),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Source",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                width: 4,
                                height: 4,
                                color: ColorConstants.mainWhite,
                                child: const DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white)),
                              );
                            }),
                          ),
                          const Text(
                            "Destination",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
          ),
        ),
      ),
    );
  }
}

//For drop down
class DropDownWidget extends StatefulWidget {
  DropDownWidget({super.key, required this.name, required this.value});

  List<String> name;
  String? value;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        // underline: const Divider(
        //   color: Colors.black,
        //   thickness: 1,
        // ),
        value: widget.value,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Color(0xff628e91),
        ),
        hint: const Text(
          'Please choose one',
          style: const TextStyle(
            color: Color(0xff628e91),
          ),
        ),
        items: widget.name.map((location) {
          return DropdownMenuItem(
            value: location,
            child: Text(
              location,
              style: const TextStyle(
                color: Color(0xff628e91),
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            widget.value = newValue;
          });
        });
  }
}
