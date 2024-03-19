import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/model/o_near_by_fuel_stations.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_fuel_stations/service/o_near_fuel_stations.dart';
import 'package:flutter/material.dart';

class ONearbyFuelStationsScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isPostLoading = false;
  List<FuelStationDetails> fuelStationList = [];

  // to Fetch the Course demo videos
  Future<bool> getFuelStations({required String placeName}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ONearbyFuelStationsScreenService()
          .getNearbyFuelStations(body: {"place_name": placeName});
      if (fetchedData.error != true) {
        NearbyBusstationsResModel resModel = fetchedData.data;
        fuelStationList = resModel.fuelStationList ?? [];

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
