class RouteAndBusDetailsResModel {
  int? status;
  RouteDetails? routeDetails;

  RouteAndBusDetailsResModel({
    this.status,
    this.routeDetails,
  });

  factory RouteAndBusDetailsResModel.fromJson(Map<String, dynamic> json) => RouteAndBusDetailsResModel(
        status: json["status"],
        routeDetails: json["data"] == null ? null : RouteDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": routeDetails?.toJson(),
      };
}

class RouteDetails {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;
  List<BusAssigned>? assignedBussesList;
  List<RouteBusStops>? stopsList;

  RouteDetails({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
    this.assignedBussesList,
    this.stopsList,
  });

  factory RouteDetails.fromJson(Map<String, dynamic> json) => RouteDetails(
        id: json["id"],
        name: json["name"],
        startsFrom: json["starts_from"],
        endsAt: json["ends_at"],
        isActive: json["is_active"],
        assignedBussesList: json["bus assigned"] == null
            ? []
            : List<BusAssigned>.from(json["bus assigned"]!.map((x) => BusAssigned.fromJson(x))),
        stopsList:
            json["stops"] == null ? [] : List<RouteBusStops>.from(json["stops"]!.map((x) => RouteBusStops.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "starts_from": startsFrom,
        "ends_at": endsAt,
        "is_active": isActive,
        "bus assigned":
            assignedBussesList == null ? [] : List<dynamic>.from(assignedBussesList!.map((x) => x.toJson())),
        "stops": stopsList == null ? [] : List<dynamic>.from(stopsList!.map((x) => x.toJson())),
      };
}

class BusAssigned {
  String? id;
  String? startTime;
  String? endTime;
  int? busowner;
  int? bus;
  int? busdriver;
  int? route;

  BusAssigned({
    this.id,
    this.startTime,
    this.endTime,
    this.busowner,
    this.bus,
    this.busdriver,
    this.route,
  });

  factory BusAssigned.fromJson(Map<String, dynamic> json) => BusAssigned(
        id: json["id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        busowner: json["busowner"],
        bus: json["bus"],
        busdriver: json["busdriver"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
        "busowner": busowner,
        "bus": bus,
        "busdriver": busdriver,
        "route": route,
      };
}

class RouteBusStops {
  String? id;
  String? stopName;
  String? timeTaken;
  int? approxCost;
  bool? isActive;
  int? routes;

  RouteBusStops({
    this.id,
    this.stopName,
    this.timeTaken,
    this.approxCost,
    this.isActive,
    this.routes,
  });

  factory RouteBusStops.fromJson(Map<String, dynamic> json) => RouteBusStops(
        id: json["id"],
        stopName: json["stop_name"],
        timeTaken: json["time_taken"],
        approxCost: json["approx_cost"],
        isActive: json["is_active"],
        routes: json["routes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stop_name": stopName,
        "time_taken": timeTaken,
        "approx_cost": approxCost,
        "is_active": isActive,
        "routes": routes,
      };
}
