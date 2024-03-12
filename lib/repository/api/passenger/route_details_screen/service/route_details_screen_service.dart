import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/passenger_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/search_result_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/route_details_screen/models/route_and_bus_details_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class RouteDetailsScreenService {
  Future<APIResponse> getRoutesDetails({required String routeId}) async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/passenger/route/$routeId/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      RouteAndBusDetailsResModel redData = RouteAndBusDetailsResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
