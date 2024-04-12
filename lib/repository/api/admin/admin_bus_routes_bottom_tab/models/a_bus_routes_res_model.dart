class AGetRoutesResModel {
  int? status;
  List<ARoutesDetails>? route;

  AGetRoutesResModel({
    this.status,
    this.route,
  });

  factory AGetRoutesResModel.fromJson(Map<String, dynamic> json) =>
      AGetRoutesResModel(
        status: json["status"],
        route: json["data"] == null
            ? []
            : List<ARoutesDetails>.from(
                json["data"]!.map((x) => ARoutesDetails.fromJson(x))),
      );
}

class ARoutesDetails {
  String? id;
  String? name;
  String? startsFrom;
  String? endsAt;
  bool? isActive;

  ARoutesDetails({
    this.id,
    this.name,
    this.startsFrom,
    this.endsAt,
    this.isActive,
  });

  factory ARoutesDetails.fromJson(Map<String, dynamic> json) => ARoutesDetails(
        id: json["id"],
        name: json["name"],
        startsFrom: json["starts_from"],
        endsAt: json["ends_at"],
        isActive: json["is_active"],
      );
}
