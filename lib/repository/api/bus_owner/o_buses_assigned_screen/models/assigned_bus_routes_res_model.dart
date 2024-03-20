class AssignedRoutesResModel {
  int? status;
  List<AssignedBussesData>? busesList;

  AssignedRoutesResModel({
    this.status,
    this.busesList,
  });

  factory AssignedRoutesResModel.fromJson(Map<String, dynamic> json) =>
      AssignedRoutesResModel(
        status: json["status"],
        busesList: json["data"] == null
            ? []
            : List<AssignedBussesData>.from(
                json["data"]!.map((x) => AssignedBussesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": busesList == null
            ? []
            : List<dynamic>.from(busesList!.map((x) => x.toJson())),
      };
}

class AssignedBussesData {
  int? id;
  RouteData? route;
  RouteBusData? bus;
  String? startTime;
  String? endTime;
  int? busowner;
  int? busdriver;

  AssignedBussesData({
    this.id,
    this.route,
    this.bus,
    this.startTime,
    this.endTime,
    this.busowner,
    this.busdriver,
  });

  factory AssignedBussesData.fromJson(Map<String, dynamic> json) =>
      AssignedBussesData(
        id: json["id"],
        route: json["route"] == null ? null : RouteData.fromJson(json["route"]),
        bus: json["bus"] == null ? null : RouteBusData.fromJson(json["bus"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        busowner: json["busowner"],
        busdriver: json["busdriver"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "route": route?.toJson(),
        "bus": bus?.toJson(),
        "start_time": startTime,
        "end_time": endTime,
        "busowner": busowner,
        "busdriver": busdriver,
      };
}

class RouteBusData {
  String? id;
  String? busowner;
  String? name;
  String? image;
  String? numberPlate;
  int? engineNo;
  String? rcBook;
  bool? isActive;

  RouteBusData({
    this.id,
    this.busowner,
    this.name,
    this.image,
    this.numberPlate,
    this.engineNo,
    this.rcBook,
    this.isActive,
  });

  factory RouteBusData.fromJson(Map<String, dynamic> json) => RouteBusData(
        id: json["id"],
        busowner: json["busowner"],
        name: json["name"],
        image: json["image"],
        numberPlate: json["Number_plate"],
        engineNo: json["Engine_no"],
        rcBook: json["RC_book"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "busowner": busowner,
        "name": name,
        "image": image,
        "Number_plate": numberPlate,
        "Engine_no": engineNo,
        "RC_book": rcBook,
        "is_active": isActive,
      };
}

class RouteData {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;

  RouteData({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
        id: json["id"],
        name: json["name"],
        startsFrom: json["starts_from"],
        endsAt: json["ends_at"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "starts_from": startsFrom,
        "ends_at": endsAt,
        "is_active": isActive,
      };
}
