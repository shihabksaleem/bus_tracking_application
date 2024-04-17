import 'package:bus_tracking_application/app_config/app_config_controller.dart';
import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/passenger_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/search_result_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/service/passenger_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassengerHomeScreenController extends ChangeNotifier {
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  PassengerRoutesListResModel? routesListResModel;
  SearchResultResModel? searchResultResModel;

  // to Fetch the Course demo videos
  Future<bool> getRoutesList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await PassengerHomeScreenService().getRoutesList();
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

  Future<bool> getSearchResult(
      {required String startingPoint, required String endPoint}) async {
    isLoading = true;
    searchResultResModel = null;

    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await PassengerHomeScreenService().getSearchResult(body: {
        "starts_from": startingPoint,
        "ends_at": endPoint,
      });
      if (fetchedData.error != true) {
        searchResultResModel = fetchedData.data;
        isLoading = false;

        if (searchResultResModel == null ||
            searchResultResModel?.buses?.length == 0) {
          AppUtils.oneTimeSnackBar("No buses Found",
              context: AppConfigController.navigatorState.currentContext!);
        }
        notifyListeners();
        return true;
      } else {
        if (searchResultResModel == null ||
            searchResultResModel?.buses?.length == 0) {
          AppUtils.oneTimeSnackBar("No buses Found",
              context: AppConfigController.navigatorState.currentContext!);
        }
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

  Future<bool> sendAlert() async {
    isLoading = true;

    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await PassengerHomeScreenService()
          .sendAlert(body: {"number": "+917994620947"});
      if (fetchedData.error != true) {
        notifyListeners();
        isLoading = false;
        print("successs 2");
        return true;
      } else {
        isLoading = false;
        print("failes 3");

        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      print("fail 4");

      notifyListeners();
      // return false;
      rethrow;
    }
  }
}
