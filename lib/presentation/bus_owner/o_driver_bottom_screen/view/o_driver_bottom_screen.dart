// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_add_driver_screen/view/o_add_driver_screen.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_driver_bottom_screen/controller/o_driver_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/o_routes_bottom_screen/controller/o_routes_bottom_screen_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerDriverScreen extends StatefulWidget {
  const OwnerDriverScreen({super.key});

  @override
  State<OwnerDriverScreen> createState() => _OwnerDriverScreenState();
}

class _OwnerDriverScreenState extends State<OwnerDriverScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ODriverBottomScreenController>(context, listen: false)
          .getDriversList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final driversScreenState =
        Provider.of<ODriverBottomScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bus Driver Details",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: driversScreenState.isLoading
          ? ReusableLoadingWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: ListView.separated(
                itemCount: driversScreenState.driversList.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      color: ColorConstants.mainBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                        bottom: BorderSide(
                            color: ColorConstants.mainBlack.withOpacity(0.2),
                            strokeAlign: BorderSide.strokeAlignOutside,
                            width: 3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name : ${driversScreenState.driversList[index].name.toString().toUpperCase()}",
                              style: TextStyle(
                                  color: ColorConstants.mainBlack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Phone : ${driversScreenState.driversList[index].phone.toString()}",
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Place : ${driversScreenState.driversList[index].address.toString()}",
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "DOB : ${driversScreenState.driversList[index].dob.toString()}",
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(Icons.delete_outline_rounded,
                        //         size: 35, color: Colors.red)),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 186, 103, 97),
                          child: IconButton(
                              onPressed: () {
                                //Todo:delete
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OwnerAddDriverScreen(),
            ),
          );
        },
        backgroundColor: ColorConstants.mainBlue.withOpacity(0.3),
        foregroundColor: ColorConstants.mainWhite,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }
}
