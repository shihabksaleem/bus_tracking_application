import 'dart:io';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_detail_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_details_add_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/services/owner_bus_details_screen_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerBusDetailScreenController with ChangeNotifier {
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  OwnerBusDetailsListModel? busDetailsListModel;
  AddBusDetailsModel? addBusDetailsModel;
  bool showSpinner =false;
  //to fetch the bus list
  Future<bool> getBusList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData = await OwnerBusDetailsScreenService().getBusList();
      if (fetchedData.error != true) {
        busDetailsListModel = fetchedData.data;
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
  //to add the bus
  Future<bool> toAddNewBusList({
    required String busName,
    required String busNumber,
    required String engineNumber,
    required File? image,
    required bool isActive,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData =
          await OwnerBusDetailsScreenService().toPostBusDetails(body: {
        "name": busName,
        "image":image,
        "Number_plate": busNumber,
        "Engine_no": engineNumber,
        "is_active": isActive,
      });
      if (fetchedData.error != true)
      {
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}

// class ToImageData {
//   static String imagetoData(String? imagepath) {
//     final extension = path.extension(
//       imagepath!.substring(imagepath.lastIndexOf("/")).replaceAll("/", ""),
//     );
//     final bytes = File(imagepath).readAsBytesSync();
//     String base64 =
//         "data:image/${extension.replaceAll(".", "")};base64,${base64Encode(bytes)}";
//     return base64;
//   }
// }
