import 'package:bus_tracking_application/repository/api/admin/admin_home_screen/models/a_bus_routes_res_model.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_home_screen/service/admin_home_screen_service.dart';
import 'package:flutter/material.dart';

class AdminRoutesBottomTabController extends ChangeNotifier {
  bool isLoading = false;

  AGetRoutesResModel? routesListResModel;

  // to Fetch the Course demo videos
  Future<bool> getRoutesList() async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminBusRoutesBottomTab().getRoutesList();
      if (fetchedData.error != true) {
        routesListResModel = fetchedData.data;

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

  Future<bool> addNewRoute({
    required String name,
    required String from,
    required String to,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminBusRoutesBottomTab().addNewRoute(body: {
        "name": name,
        "starts_from": from,
        "ends_at": to,
      });
      if (fetchedData.error != true) {
        await getRoutesList();
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
