import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/model/o_near_by_fuel_stations.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/service/o_near_fuel_stations.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_workshops/model/o_near_by_workshops.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_workshops/service/o_near_workshops.dart';
import 'package:flutter/material.dart';

class ONearbyWorkShopsScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isPostLoading = false;
  List<WorkshopDetails> workShpsList = [];

  // to Fetch the Course demo videos
  Future<bool> getWorkShops({required String placeName}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ONearbyWorkShopsScreenService()
          .getNearbyWorkshops(body: {"place_name": placeName});
      if (fetchedData.error != true) {
        NearbyWorkShopsResModel resModel = fetchedData.data;
        workShpsList = resModel.workshopList ?? [];

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
