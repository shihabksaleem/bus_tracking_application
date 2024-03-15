class ODriversListResModel {
  int? status;
  List<ODriversDetails>? driversList;

  ODriversListResModel({
    this.status,
    this.driversList,
  });

  factory ODriversListResModel.fromJson(Map<String, dynamic> json) =>
      ODriversListResModel(
        status: json["status"],
        driversList: json["data"] == null
            ? []
            : List<ODriversDetails>.from(json["data"]!.map((x) => ODriversDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": driversList == null
            ? []
            : List<dynamic>.from(driversList!.map((x) => x.toJson())),
      };
}

class ODriversDetails {
  String? id;
  String? busowner;
  String? name;
  String? phone;
  String? address;
  String? license;
  int? age;
  DateTime? dob;

  ODriversDetails({
    this.id,
    this.busowner,
    this.name,
    this.phone,
    this.address,
    this.license,
    this.age,
    this.dob,
  });

  factory ODriversDetails.fromJson(Map<String, dynamic> json) => ODriversDetails(
        id: json["id"],
        busowner: json["busowner"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        license: json["license"],
        age: json["age"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "busowner": busowner,
        "name": name,
        "phone": phone,
        "address": address,
        "license": license,
        "age": age,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
      };
}
