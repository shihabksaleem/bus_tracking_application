class ABusStopsResModel {
  int? status;
  ARouteData? route;

  ABusStopsResModel({
    this.status,
    this.route,
  });

  factory ABusStopsResModel.fromJson(Map<String, dynamic> json) =>
      ABusStopsResModel(
        status: json["status"],
        route: json["data"] == null ? null : ARouteData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": route?.toJson(),
      };
}

class ARouteData {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;
  List<ARouteStops>? stops;

  ARouteData({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
    this.stops,
  });

  factory ARouteData.fromJson(Map<String, dynamic> json) => ARouteData(
        id: json["id"],
        name: json["name"],
        startsFrom: json["starts_from"],
        endsAt: json["ends_at"],
        isActive: json["is_active"],
        stops: json["stops"] == null
            ? []
            : List<ARouteStops>.from(
                json["stops"]!.map((x) => ARouteStops.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "starts_from": startsFrom,
        "ends_at": endsAt,
        "is_active": isActive,
        "stops": stops == null
            ? []
            : List<dynamic>.from(stops!.map((x) => x.toJson())),
      };
}

class ARouteStops {
  String? id;
  String? routes;
  String? stopName;
  String? timeTaken;
  int? approxCost;
  bool? isActive;

  ARouteStops({
    this.id,
    this.routes,
    this.stopName,
    this.timeTaken,
    this.approxCost,
    this.isActive,
  });

  factory ARouteStops.fromJson(Map<String, dynamic> json) => ARouteStops(
        id: json["id"],
        routes: json["routes"],
        stopName: json["stop_name"],
        timeTaken: json["time_taken"],
        approxCost: json["approx_cost"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "routes": routes,
        "stop_name": stopName,
        "time_taken": timeTaken,
        "approx_cost": approxCost,
        "is_active": isActive,
      };
}
