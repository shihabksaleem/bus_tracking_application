import 'dart:convert';

import 'package:bus_tracking_application/app_config/app_config.dart';
import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/passenger_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/passenger/passenger_home_screen/modes/search_result_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';
import 'package:http/http.dart' as http;

class PassengerHomeScreenService {
  Future<APIResponse> getRoutesList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/passenger/route/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      PassengerRoutesListResModel redData =
          PassengerRoutesListResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> getSearchResult(
      {required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/passenger/route/search_route/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      SearchResultResModel redData =
          SearchResultResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> sendAlert({required Map<String, dynamic> body}) async {
    final response = await http
        .post(Uri.parse("${AppConfig.baseUrl}/passenger/alert/"), body: body);
    print("hellllooo");

    if (response.statusCode == 200) {
      // print("success");
      // final decodedData = jsonDecode(response.body);
      return APIResponse(
          data: "SOS message sent successfully!",
          error: false,
          errorMessage: "");
    } else {
      return APIResponse(
          data: "unable to send SOS message!", error: true, errorMessage: "");
    }
  }
}
