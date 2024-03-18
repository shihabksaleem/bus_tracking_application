// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/core/constants/image_constants.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_bus_details/controller/owner_bus_details_screen_controller.dart';
import 'package:bus_tracking_application/presentation/bus_owner/owner_bus_details/view/owner_bus_details.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_detail_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_utils/app_utils.dart';

class OBusesBottomScreen extends StatefulWidget {
  const OBusesBottomScreen({super.key});

  @override
  State<OBusesBottomScreen> createState() => _OBusesBottomScreenState();
}

class _OBusesBottomScreenState extends State<OBusesBottomScreen> {
  late List<OwnerBusDetailsListModel> ownerBusListModel;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OwnerBusDetailScreenController>(context, listen: false)
          .getBusList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Available busses",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Consumer<OwnerBusDetailScreenController>(
        builder: (context, controller, child) {
          return controller.isLoading
              ? Center(
                  child: ReusableLoadingWidget(),
                )
              : ListView.builder(
                  itemCount: controller.busDetailsListModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final busDetails =
                        controller.busDetailsListModel!.data![index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color(0xFFC8E6C9),
                      ),
                      child: ListTile(
                        leading: Image.asset(ImageConstants.busesPng),
                        title: Text(
                          busDetails.name ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Owner : ${busDetails.busowner ?? ""}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Bus no:${busDetails.numberPlate ?? ""}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Engine Number: ${busDetails.engineNo ?? ""}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                "Rc Book: ${busDetails.rcBook ?? "Not Updated"}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                "Is Active: ${busDetails.isActive == true ? "Active" : "Inactive"}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),

                        // Todo: uncomment if needed  to bus edit  and delete
                        // trailing: Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(Icons.edit_outlined),
                        //     ),
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(Icons.delete_outline_rounded),
                        //       color: Colors.red,
                        //     ),
                        //   ],
                        // ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OwnerBusDetails(),
            ),
          );
        },
        backgroundColor: ColorConstants.mainBlue,
        foregroundColor: ColorConstants.mainWhite,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
