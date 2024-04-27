import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_detail_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/owner_bus_details_screen/model/owner_bus_details_add_model.dart';
import '../../../../../core/app_utils/app_utils.dart';
import '../../../../hleper/api_helper.dart';
import '../../../../hleper/api_response.dart';

class OwnerBusDetailsScreenService {
  Future<APIResponse> getBusList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/owner/bus/",
        header: ApiHelper.getApiHeader(
          access: await AppUtils.getAccessKey(),
        ));
    if (response.error) {
      return response;
    } else {
      OwnerBusDetailsListModel redData =
          OwnerBusDetailsListModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> toPostBusDetails(
      {required Map<String, dynamic> body}) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/owner/bus/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      // return response;
      AddBusDetailsModel redData = AddBusDetailsModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> delteBus({required String busId}) async {
    final APIResponse response = await ApiHelper.deleteData(
        body: {},
        endPoint: "/owner/bus/$busId/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }
}
