import 'package:bus_tracking_application/repository/api/bus_owner/o_bottom_drivers_screen/models/o_drivers_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_bottom_drivers_screen/service/o_drivers_bottom_screen_service.dart';
import 'package:flutter/material.dart';

class ODriverBottomScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isPostLoading = false;
  List<DriverDetails> driversList = [];

  // to Fetch the Course demo videos
  Future<bool> getDriversList() async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ODriversBottomScreenService().getDriversList();
      if (fetchedData.error != true) {
        DriverListResModel resModel = fetchedData.data;
        driversList = resModel.driversList ?? [];
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

  Future<bool> delteDriver({required String driverId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await ODriversBottomScreenService().delteDriver(driverId: driverId);
      if (fetchedData.error != true) {
        await getDriversList();
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
