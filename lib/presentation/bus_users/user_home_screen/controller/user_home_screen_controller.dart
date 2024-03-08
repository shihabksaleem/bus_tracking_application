import 'dart:convert';
import 'package:bus_tracking_application/app_config/app_config.dart';
import 'package:bus_tracking_application/repository/api/bus_users/bus_user_login/model/login_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_users/bus_user_login/services/bus_user_login_services.dart';
import 'package:bus_tracking_application/repository/api/bus_users/user_home_screen/modes/routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_users/user_home_screen/service/user_home_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserHomeScreenController extends ChangeNotifier {
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  RoutesListResModel? routesListResModel;

  // to Fetch the Course demo videos
  Future<bool> getRoutesList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await UserHomeScreenService().getRoutesList();
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
}
