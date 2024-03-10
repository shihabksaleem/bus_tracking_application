import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/passenger_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/search_result_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class PassengerHomeScreenService {
  Future<APIResponse> getRoutesList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/passenger/route/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      PassengerRoutesListResModel redData = PassengerRoutesListResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> getSearchResult({required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/passenger/route/search_route/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      SearchResultResModel redData = SearchResultResModel.fromJson(response.data['data']);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
