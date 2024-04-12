import 'package:bus_tracking_application/repository/api/admin/admin_login_screen/model/admin_login_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class AdminLoginScreenService {
  Future<APIResponse> onAdminLogin({required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/Admin/token/",
        header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      AdminLoginResModel redData = AdminLoginResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
