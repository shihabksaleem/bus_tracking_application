class DriverListResModel {
  int? status;
  List<DriverDetails>? driversList;

  DriverListResModel({
    this.status,
    this.driversList,
  });

  factory DriverListResModel.fromJson(Map<String, dynamic> json) =>
      DriverListResModel(
        status: json["status"],
        driversList: json["data"] == null
            ? []
            : List<DriverDetails>.from(
                json["data"]!.map((x) => DriverDetails.fromJson(x))),
      );
}

class DriverDetails {
  String? id;
  String? busowner;
  String? name;
  String? phone;
  String? address;
  String? license;
  int? age;
  String? dob;

  DriverDetails({
    this.id,
    this.busowner,
    this.name,
    this.phone,
    this.address,
    this.license,
    this.age,
    this.dob,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
        id: json["id"],
        busowner: json["busowner"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        license: json["license"],
        age: json["age"],
        dob: json["dob"],
      );
}
