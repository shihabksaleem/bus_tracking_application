import 'package:bus_tracking_application/repository/api/bus_owner/o_buses_assigned_screen/models/assigned_bus_routes_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_buses_assigned_screen/service/o_buses_assigned_screen_service.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/model/o_near_by_fuel_stations.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/service/o_near_fuel_stations.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_workshops/model/o_near_by_workshops.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_workshops/service/o_near_workshops.dart';
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
}
