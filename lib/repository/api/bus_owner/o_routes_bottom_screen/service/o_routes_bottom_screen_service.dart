import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/models/o_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/models/owner_bus_list_api_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class ORouteBottomScreenService {
  Future<APIResponse> getRoutesList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/owner/routes/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      ORoutesListResModel redData = ORoutesListResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> getBusList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/owner/bus/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      OwnerBusListApiResModel redData =
          OwnerBusListApiResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
