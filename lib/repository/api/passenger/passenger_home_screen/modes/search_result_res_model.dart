class SearchResultResModel {
  int? status;
  List<Bus>? buses;

  SearchResultResModel({
    this.status,
    this.buses,
  });

  factory SearchResultResModel.fromJson(Map<String, dynamic> json) => SearchResultResModel(
        status: json["status"],
        buses: json["buses"] == null ? [] : List<Bus>.from(json["buses"]!.map((x) => Bus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "buses": buses == null ? [] : List<dynamic>.from(buses!.map((x) => x.toJson())),
      };
}

class Bus {
  String? id;
  String? name;
  String? image;
  String? numberPlate;
  int? engineNo;
  dynamic rcBook;
  bool? isActive;
  int? busowner;
  List<RouteAssignment>? routeAssignments;

  Bus({
    this.id,
    this.name,
    this.image,
    this.numberPlate,
    this.engineNo,
    this.rcBook,
    this.isActive,
    this.busowner,
    this.routeAssignments,
  });

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        numberPlate: json["Number_plate"],
        engineNo: json["Engine_no"],
        rcBook: json["RC_book"],
        isActive: json["is_active"],
        busowner: json["busowner"],
        routeAssignments: json["route_assignments"] == null
            ? []
            : List<RouteAssignment>.from(json["route_assignments"]!.map((x) => RouteAssignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "Number_plate": numberPlate,
        "Engine_no": engineNo,
        "RC_book": rcBook,
        "is_active": isActive,
        "busowner": busowner,
        "route_assignments":
            routeAssignments == null ? [] : List<dynamic>.from(routeAssignments!.map((x) => x.toJson())),
      };
}

class RouteAssignment {
  int? routeId;
  String? startTime;
  String? endTime;
  String? route;

  RouteAssignment({
    this.routeId,
    this.startTime,
    this.endTime,
    this.route,
  });

  factory RouteAssignment.fromJson(Map<String, dynamic> json) => RouteAssignment(
        routeId: json["route_id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "route_id": routeId,
        "start_time": startTime,
        "end_time": endTime,
        "route": route,
      };
}
