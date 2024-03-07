import 'dart:convert';
import 'package:bus_tracking_application/app_config/app_config.dart';
import 'package:bus_tracking_application/repository/api/bus_users/bus_user_login/model/login_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_users/bus_user_login/services/bus_user_login_services.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  LoginResModel? loginData;
  bool isPasswordVisible = false;

  // to Fetch the Course demo videos

  Future<bool> onLogin(
      {required String userName, required String password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await BusUserLoginService().onLogin(body: {
        "username": userName,
        "password": password,
      });
      if (fetchedData.error != true) {
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token,
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
