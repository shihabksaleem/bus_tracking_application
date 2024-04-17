import 'package:bus_tracking_application/repository/api/admin/admin_owners_bottom_tab/models/a_owners_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_owners_bottom_tab/service/admin_owners_bottom_tab_service.dart';
import 'package:flutter/material.dart';

class AdminOwnersBottomTabController extends ChangeNotifier {
  bool isLoading = false;

  AOwnersListResModel? ownersResModel;

  // to Fetch the Course demo videos
  Future<bool> getOwners() async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminOwnersBottomTabService().getOwners();
      if (fetchedData.error != true) {
        ownersResModel = fetchedData.data;

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

  Future<bool> approveOwners({required String ownerId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminOwnersBottomTabService().approveOwners(
        ownerId: "ownerId",
      );
      if (fetchedData.error != true) {
        await getOwners();
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
