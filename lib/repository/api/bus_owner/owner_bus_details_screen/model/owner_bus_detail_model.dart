// To parse this JSON data, do
//
//     final busDetails = busDetailsFromJson(jsonString);

import 'dart:convert';

OwnerBusDetailsListModel busDetailsFromJson(String str) => OwnerBusDetailsListModel.fromJson(json.decode(str));

String busDetailsToJson(OwnerBusDetailsListModel data) => json.encode(data.toJson());

class OwnerBusDetailsListModel {
  int? status;
  List<BusList>? data;

  OwnerBusDetailsListModel({
    this.status,
    this.data,
  });

  factory OwnerBusDetailsListModel.fromJson(Map<String, dynamic> json) => OwnerBusDetailsListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<BusList>.from(json["data"]!.map((x) => BusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BusList {
  String? id;
  String? busowner;
  String? name;
  String? image;
  String? numberPlate;
  int? engineNo;
  dynamic rcBook;
  bool? isActive;

  BusList({
    this.id,
    this.busowner,
    this.name,
    this.image,
    this.numberPlate,
    this.engineNo,
    this.rcBook,
    this.isActive,
  });

  factory BusList.fromJson(Map<String, dynamic> json) => BusList(
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
