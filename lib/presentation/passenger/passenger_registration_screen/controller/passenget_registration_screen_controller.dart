import 'package:bus_tracking_application/repository/api/passenger/passenger_login_screen/model/passenger_login_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_registration_screen/service/passenger_registratoin_screen_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassengerRegistrationScreenController with ChangeNotifier {
  // bool isLogged = false;
  bool isLoading = false;

  // bool isPasswordVisible = false;

  // to Fetch the Course demo videos

  Future<bool> onPasssengerLogin({
    required String userName,
    required String password,
    required String emailAddress,
    required String address,
    required String phone,
    required String name,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await PassengerRegistrationScreenService().onRegisteration(body: {
        "name": name,
        "phone": phone,
        "address": address,
        "email_address": emailAddress,
        "username": userName,
        "password": password,
      });
      if (fetchedData.error != true) {
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
