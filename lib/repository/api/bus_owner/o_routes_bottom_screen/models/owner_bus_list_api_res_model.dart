class OwnerBusListApiResModel {
  int? status;
  List<OwnerBusDetails>? busList;

  OwnerBusListApiResModel({
    this.status,
    this.busList,
  });

  factory OwnerBusListApiResModel.fromJson(Map<String, dynamic> json) =>
      OwnerBusListApiResModel(
        status: json["status"],
        busList: json["data"] == null
            ? []
            : List<OwnerBusDetails>.from(
                json["data"]!.map((x) => OwnerBusDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": busList == null
            ? []
            : List<dynamic>.from(busList!.map((x) => x.toJson())),
      };
}

class OwnerBusDetails {
  String? id;
  String? busowner;
  String? name;
  String? image;
  String? numberPlate;
  int? engineNo;
  dynamic rcBook;
  bool? isActive;

  OwnerBusDetails({
    this.id,
    this.busowner,
    this.name,
    this.image,
    this.numberPlate,
    this.engineNo,
    this.rcBook,
    this.isActive,
  });

  factory OwnerBusDetails.fromJson(Map<String, dynamic> json) =>
      OwnerBusDetails(
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
