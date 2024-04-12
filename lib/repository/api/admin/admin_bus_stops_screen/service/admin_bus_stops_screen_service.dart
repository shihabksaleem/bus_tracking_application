import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_bus_stops_screen/models/admin_bus_stops_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class AdminBusStopsScreenService {
  Future<APIResponse> getBusRouteStops({required String routeId}) async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/Admin/route/$routeId/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      ABusStopsResModel redData = ABusStopsResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> addNewStop(
      {required Map<String, dynamic> body, required String routeId}) async {
    final APIResponse response = await ApiHelper.postData(
        endPoint: "/Admin/route/$routeId/add_stop/",
        body: body,
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: "");
    }
  }
}
