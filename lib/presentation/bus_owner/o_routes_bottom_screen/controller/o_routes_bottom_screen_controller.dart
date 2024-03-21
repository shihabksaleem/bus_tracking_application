import 'package:bus_tracking_application/presentation/global_widgets/custom_drop_down_widget/model/custom_drop_down_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/models/o_drivers_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/models/o_routes_list_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/models/owner_bus_list_api_res_model.dart';
import 'package:bus_tracking_application/repository/api/bus_owner/o_routes_bottom_screen/service/o_routes_bottom_screen_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ORoutesBottomScreenControlller with ChangeNotifier {
  bool isLoading = false;
  bool isPostLoading = false;
  late SharedPreferences sharedPreferences;
  ORoutesListResModel? routesListResModel;
  List<CustomDropDownModel> bussesList = [];
  String? selectedStartTime;
  String? selectedEndTime;

  List<CustomDropDownModel> driverList = [];

  CustomDropDownModel? selectedBus;
  CustomDropDownModel? selectedDriver;

  // to Fetch the Course demo videos
  Future<bool> getRoutesList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ORouteBottomScreenService().getRoutesList();
      if (fetchedData.error != true) {
        routesListResModel = fetchedData.data;

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // to Fetch the Course demo videos
  Future<bool> getBusList() async {
    print("get busses");
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ORouteBottomScreenService().getBusList();
      if (fetchedData.error != true) {
        OwnerBusListApiResModel resModel = fetchedData.data;

        if (resModel.busList != null && resModel.busList!.isNotEmpty) {
          bussesList = resModel.busList!
              .map(
                (e) => CustomDropDownModel(
                  id: e.id.toString(),
                  value: e.id.toString(),
                  text: e.name.toString(),
                ),
              )
              .toList();
        }
        print(bussesList.length);

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // to get the drivers detials
  Future<bool> getDriversList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ORouteBottomScreenService().getDriversList();
      if (fetchedData.error != true) {
        ODriversListResModel resModel = fetchedData.data;

        if (resModel.driversList != null && resModel.driversList!.isNotEmpty) {
          driverList = resModel.driversList!
              .map((element) => CustomDropDownModel(
                  id: element.id.toString(),
                  value: element.id.toString(),
                  text: element.name.toString()))
              .toList();
        }
        print(driverList.length);

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // to assign bus to a route
  Future<bool> assignBus({required String routeid}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isPostLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await ORouteBottomScreenService().assignBus(routeid: routeid, body: {
        "start_time": selectedStartTime,
        "end_time": selectedEndTime,
        "bus": int.tryParse(selectedBus!.id),
        "busdriver": int.tryParse(selectedDriver!.id),
      });
      if (fetchedData.error != true) {
        // OwnerBusListApiResModel resModel = fetchedData.data;

        // if (resModel.busList != null && resModel.busList!.isNotEmpty) {
        //   bussesList = resModel.busList!
        //       .map((e) => CustomDropDownModel(id: e.id.toString(), value: e.id.toString(), text: e.name.toString()))
        //       .toList();
        // }
        // print(bussesList.length);

        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }

  onBusSelection(CustomDropDownModel value) {
    selectedBus = value;
    notifyListeners();
  }

  onDriversSelection(CustomDropDownModel value) {
    selectedDriver = value;
    notifyListeners();
  }

  onTimeSelection({bool isStart = true, required String selectedTime}) {
    if (isStart) {
      selectedStartTime = selectedTime;
    } else {
      selectedEndTime = selectedTime;
    }
    print("$selectedStartTime - startTime");
    print("$selectedEndTime - endTime");
    notifyListeners();
  }

  clearData() {
    selectedBus = null;
    selectedDriver = null;
    selectedStartTime = null;
    selectedEndTime = null;
    notifyListeners();
  }
}
