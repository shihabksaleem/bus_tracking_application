import 'package:bus_tracking_application/repository/api/admin/admin_bus_stops_screen/models/admin_bus_stops_res_model.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_bus_stops_screen/service/admin_bus_stops_screen_service.dart';
import 'package:flutter/material.dart';

class AdminBusStopsScreenController extends ChangeNotifier {
  bool isLoading = false;

  ABusStopsResModel? stopsRes;

  // to Fetch the Course demo videos
  Future<bool> getBusRouteStops({required String routeId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await AdminBusStopsScreenService().getBusRouteStops(routeId: routeId);
      if (fetchedData.error != true) {
        stopsRes = fetchedData.data;

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

  Future<bool> addNewRoute(
      {required String name,
      required String cost,
      required String time,
      required String routeId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminBusStopsScreenService().addNewStop(
        body: {
          "stop_name": name,
          "time_taken": time,
          "approx_cost": double.tryParse(cost),
        },
        routeId: routeId,
      );
      if (fetchedData.error != true) {
        await getBusRouteStops(routeId: routeId);
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
