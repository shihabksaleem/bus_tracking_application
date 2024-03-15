import 'dart:convert';
import 'package:bus_tracking_application/app_config/app_config.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_login_screen/model/admin_login_res_model.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_login_screen/services/admin_login_screen_service.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  AdminLoginResModel? loginData;
  bool isPasswordVisible = false;

  Future<bool> onAdminLogin(
      {required String userName, required String password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await AdminLoginScreenService().onAdminLogin(body: {
        "username": userName,
        "password": password,
      });
      if (fetchedData.error != true) {
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token,
            "userType": "admin"
          };

          ///setting shared pref
          ///this is where first time the data is stored to sharedpref as map converted json.
          await sharedPreferences.setString(
              AppConfig.LOGIN_DATA, jsonEncode(sharedData));
        }

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

  void eyButton() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
