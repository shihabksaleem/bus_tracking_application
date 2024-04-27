import 'package:bus_tracking_application/repository/api/bus_owner/o_buses_assigned_screen/models/assigned_bus_routes_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_buses_assigned_screen/service/o_buses_assigned_screen_service.dart';
import 'package:flutter/material.dart';

class OBussesAssignedScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isPostLoading = false;
  List<AssignedBussesData> assignedBusList = [];

  // to Fetch the Course demo videos
  Future<bool> getAssignedBusses({required String routeId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await OBussesAssignedScreenService()
          .getAssignedBusses(routeId: routeId);
      if (fetchedData.error != true) {
        AssignedRoutesResModel resModel = fetchedData.data;
        assignedBusList = resModel.busesList ?? [];

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

  // to Fetch the Course demo videos
  Future<bool> delteAssignedBus(
      {required String busId, required String routeId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await OBussesAssignedScreenService().delteBus(busId: busId);
      if (fetchedData.error != true) {
        await getAssignedBusses(routeId: routeId);
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
