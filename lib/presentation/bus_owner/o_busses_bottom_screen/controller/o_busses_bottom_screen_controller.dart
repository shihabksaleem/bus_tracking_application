import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_detail_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/services/owner_bus_details_screen_services.dart';
import 'package:flutter/material.dart';

class OBussesBottomScreenController with ChangeNotifier {
  bool isLoading = false;
  OwnerBusDetailsListModel? busDetailsListModel;

  bool showSpinner = false;
  //to fetch the bus list
  Future<bool> getBusList() async {
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
}
