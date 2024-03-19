class NearbyWorkShopsResModel {
  List<WorkshopDetails>? workshopList;

  NearbyWorkShopsResModel({
    this.workshopList,
  });

  factory NearbyWorkShopsResModel.fromJson(Map<String, dynamic> json) =>
      NearbyWorkShopsResModel(
        workshopList: json["workshop"] == null
            ? []
            : List<WorkshopDetails>.from(
                json["workshop"]!.map((x) => WorkshopDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workshop": workshopList == null
            ? []
            : List<dynamic>.from(workshopList!.map((x) => x.toJson())),
      };
}

class WorkshopDetails {
  String? placeId;
  String? osmType;
  String? osmId;
  String? lat;
  String? lon;
  String? workshopClass;
  String? type;
  String? tagType;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;
  int? distance;

  WorkshopDetails({
    this.placeId,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.workshopClass,
    this.type,
    this.tagType,
    this.name,
    this.displayName,
    this.address,
    this.boundingbox,
    this.distance,
  });

  factory WorkshopDetails.fromJson(Map<String, dynamic> json) =>
      WorkshopDetails(
        placeId: json["place_id"],
        osmType: json["osm_type"]!,
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        workshopClass: json["class"]!,
        type: json["type"]!,
        tagType: json["tag_type"]!,
        name: json["name"],
        displayName: json["display_name"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        boundingbox: json["boundingbox"] == null
            ? []
            : List<String>.from(json["boundingbox"]!.map((x) => x)),
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "osm_type": osmType,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
        "class": workshopClass,
        "type": type,
        "tag_type": tagType,
        "name": name,
        "display_name": displayName,
        "address": address?.toJson(),
        "boundingbox": boundingbox == null
            ? []
            : List<dynamic>.from(boundingbox!.map((x) => x)),
        "distance": distance,
      };
}

class Address {
  String? name;
  String? road;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? countryCode;

  Address({
    this.name,
    this.road,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        road: json["road"],
        city: json["city"],
        state: json["state"]!,
        postcode: json["postcode"],
        country: json["country"]!,
        countryCode: json["country_code"]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "road": road,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
      };
}
