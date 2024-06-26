import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_bus_routes_bottom_tab/models/a_bus_routes_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class AdminBusRoutesBottomTabService {
  Future<APIResponse> getRoutesList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/Admin/route/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      AGetRoutesResModel redData = AGetRoutesResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> delteRoutes({required String routeId}) async {
    final APIResponse response = await ApiHelper.deleteData(
        body: {},
        endPoint: "/Admin/route/$routeId/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      AGetRoutesResModel redData = AGetRoutesResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> addNewRoute({required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        endPoint: "/Admin/route/",
        body: body,
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      // AGetRoutesResModel redData = AGetRoutesResModel.fromJson(response.data);
      return APIResponse(data: "redData", error: false, errorMessage: "");
    }
  }
}
