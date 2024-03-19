import 'package:bus_tracking_application/repository/api/bus_owner/o_add_driver_screen/service/o_add_driver_screen_service.dart';
import 'package:flutter/material.dart';

class OAddDriverScreenController with ChangeNotifier {
  bool isPostLoading = false;
  // bool isPostLoading = false;

  // to Fetch the Course demo videos
  Future<bool> addNewDriver({
    required String name,
    required String phone,
    required String address,
    required String age,
    required String dob,
  }) async {
    isPostLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await OAddDriversScreenService().addNewDriver(body: {
        "name": name,
        "phone": phone,
        "address": address,
        "age": age,
        "dob": dob,
      });
      if (fetchedData.error != true) {
        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }
}
