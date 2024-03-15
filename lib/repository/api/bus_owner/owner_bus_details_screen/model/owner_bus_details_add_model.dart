// To parse this JSON data, do
//
//     final addBusDetails = addBusDetailsFromJson(jsonString);

import 'dart:convert';

AddBusDetailsModel addBusDetailsFromJson(String str) => AddBusDetailsModel.fromJson(json.decode(str));

String addBusDetailsToJson(AddBusDetailsModel data) => json.encode(data.toJson());

class AddBusDetailsModel {
  int? status;
  BusDetailsList? data;

  AddBusDetailsModel({
    this.status,
    this.data,
  });

  factory AddBusDetailsModel.fromJson(Map<String, dynamic> json) => AddBusDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : BusDetailsList.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class BusDetailsList {
  String? id;
  String? busowner;
  String? name;
  String? image;
  String? numberPlate;
  int? engineNo;
  dynamic rcBook;
  bool? isActive;

  BusDetailsList({
    this.id,
    this.busowner,
    this.name,
    this.image,
    this.numberPlate,
    this.engineNo,
    this.rcBook,
    this.isActive,
  });

  factory BusDetailsList.fromJson(Map<String, dynamic> json) => BusDetailsList(
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
