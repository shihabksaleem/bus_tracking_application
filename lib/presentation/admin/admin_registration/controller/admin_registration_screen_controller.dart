import 'package:bus_tracking_application/repository/api/admin/admin_registration_screen/services/admin_registration_screen_service.dart';
import 'package:flutter/cupertino.dart';

class AdminRegistrationScreenController with ChangeNotifier {
  bool isLoading = false;
  onRegister({
    required String userName,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchData = await AdminRegistrationScreenService().onRegisteration(
        body: {
          "username": userName,
          "email": email,
          "password": password,
        },
      );
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
