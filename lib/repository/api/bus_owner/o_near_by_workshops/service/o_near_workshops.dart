import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_near_by_workshops/model/o_near_by_workshops.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class ONearbyWorkShopsScreenService {
  Future<APIResponse> getNearbyWorkshops(
      {required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/owner/workshop/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      NearbyWorkShopsResModel redData =
          NearbyWorkShopsResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
