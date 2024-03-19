import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_bottom_drivers_screen/models/o_drivers_list_res_model.dart';
import 'package:bus_tracking_application/repository/hleper/api_helper.dart';
import 'package:bus_tracking_application/repository/hleper/api_response.dart';

class ODriversBottomScreenService {
  Future<APIResponse> getDriversList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/owner/busdriver/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      DriverListResModel redData = DriverListResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
