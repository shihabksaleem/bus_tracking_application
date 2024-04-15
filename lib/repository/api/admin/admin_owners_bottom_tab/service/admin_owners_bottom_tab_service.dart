import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/admin/admin_owners_bottom_tab/models/a_owners_list_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class AdminOwnersBottomTabService {
  Future<APIResponse> getOwners() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/Admin/ownerview/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      AOwnersListResModel redData = AOwnersListResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> approveOwners({required String ownerId}) async {
    final APIResponse response = await ApiHelper.postData(
        endPoint: "/Admin/ownerview/$ownerId/owner_approval/",
        body: {},
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: "");
    }
  }
}
