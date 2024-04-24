import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class AdminRegistrationScreenService {
  Future<APIResponse> onRegisteration(
      {required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/Admin/register/",
        header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      return response;
    }
  }
}
