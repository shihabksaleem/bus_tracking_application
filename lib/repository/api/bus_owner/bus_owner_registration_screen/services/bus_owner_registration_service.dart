import 'package:bus_tracking_application/repository/hleper/api_helper.dart';

import '../../../../hleper/api_response.dart';

class BusOwnerRegistrationService {
  Future<APIResponse> onRegister({required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        endPoint: '/owner/register/',
        header: ApiHelper.getApiHeader(),
        body: body);
    if (response.error) {
      return response;
    } else {
      return response;
    }
  }
}
