import 'package:bus_tracking_application/repository/api/bus_users/bus_user_login/model/login_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class BusUserLoginService {
  Future<APIResponse> onLogin({required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/passenger/token/",
        header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      LoginResModel redData = LoginResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
