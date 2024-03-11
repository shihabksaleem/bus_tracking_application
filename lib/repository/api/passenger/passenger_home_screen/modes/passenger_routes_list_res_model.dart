class PassengerRoutesListResModel {
  int? status;
  List<RoutesData>? routesList;

  PassengerRoutesListResModel({
    this.status,
    this.routesList,
  });

  factory PassengerRoutesListResModel.fromJson(Map<String, dynamic> json) => PassengerRoutesListResModel(
        status: json["status"],
        routesList: json["data"] == null ? [] : List<RoutesData>.from(json["data"]!.map((x) => RoutesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": routesList == null ? [] : List<dynamic>.from(routesList!.map((x) => x.toJson())),
      };
}

class RoutesData {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;

  RoutesData({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
  });

  factory RoutesData.fromJson(Map<String, dynamic> json) => RoutesData(
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
