import 'package:bus_tracking_application/repository/api/passenger/route_details_screen/models/route_and_bus_details_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/route_details_screen/service/route_details_screen_service.dart';
import 'package:flutter/material.dart';

class RouteDetailsScreenController extends ChangeNotifier {
  bool isLoading = false;
  List<BusAssigned> asignedBusList = [];
  RouteAndBusDetailsResModel? routeAndBusDetailsResModel;

  // to Fetch the Course demo videos
  Future<bool> getRoutesDetails({required String routeId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await RouteDetailsScreenService().getRoutesDetails(routeId: routeId);
      if (fetchedData.error != true) {
        routeAndBusDetailsResModel = fetchedData.data;
        asignedBusList = routeAndBusDetailsResModel?.routeDetails?.assignedBussesList ?? [];
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
