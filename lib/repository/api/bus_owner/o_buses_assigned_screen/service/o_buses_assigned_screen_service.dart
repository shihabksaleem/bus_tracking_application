import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_buses_assigned_screen/models/assigned_bus_routes_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class OBussesAssignedScreenService {
  Future<APIResponse> getAssignedBusses({required String routeId}) async {
    final APIResponse response = await ApiHelper.postData(
        body: {},
        endPoint: "/owner/routes/$routeId/my_buses/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      AssignedRoutesResModel redData =
          AssignedRoutesResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
