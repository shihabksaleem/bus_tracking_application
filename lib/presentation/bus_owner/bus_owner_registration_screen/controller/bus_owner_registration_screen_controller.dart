import 'package:bus_tracking_application/repository/api/bus_owner/bus_owner_registration_screen/services/bus_owner_registration_service.dart';
import 'package:flutter/cupertino.dart';

class BusOwnerRegistrationScreenController with ChangeNotifier {
  bool isLoading = false;
  onRegister(
      {required String name,
      required String userName,
      required String password,
      required String phoneNumber,
      required String address}) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchData = await BusOwnerRegistrationService().onRegister(body: {
        "name": name,
        "username": userName,
        "password": password,
        "phone": phoneNumber,
        "address": address,
      });
      if (fetchData.error != true) {
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
