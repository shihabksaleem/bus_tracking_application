class ORoutesListResModel {
  int? status;
  List<ORoutesDetails>? data;

  ORoutesListResModel({
    this.status,
    this.data,
  });

  factory ORoutesListResModel.fromJson(Map<String, dynamic> json) =>
      ORoutesListResModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ORoutesDetails>.from(
                json["data"]!.map((x) => ORoutesDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ORoutesDetails {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;

  ORoutesDetails({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
  });

  factory ORoutesDetails.fromJson(Map<String, dynamic> json) => ORoutesDetails(
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
