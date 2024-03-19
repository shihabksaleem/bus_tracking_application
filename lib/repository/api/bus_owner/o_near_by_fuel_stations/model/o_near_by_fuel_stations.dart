class NearbyBusstationsResModel {
  List<FuelStationDetails>? fuelStationList;

  NearbyBusstationsResModel({
    this.fuelStationList,
  });

  factory NearbyBusstationsResModel.fromJson(Map<String, dynamic> json) =>
      NearbyBusstationsResModel(
        fuelStationList: json["fuel_station"] == null
            ? []
            : List<FuelStationDetails>.from(json["fuel_station"]!
                .map((x) => FuelStationDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fuel_station": fuelStationList == null
            ? []
            : List<dynamic>.from(fuelStationList!.map((x) => x.toJson())),
      };
}

class FuelStationDetails {
  String? placeId;
  String? osmType;
  String? osmId;
  String? lat;
  String? lon;
  String? fuelStationClass;
  String? type;
  String? tagType;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;
  int? distance;

  FuelStationDetails({
    this.placeId,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.fuelStationClass,
    this.type,
    this.tagType,
    this.name,
    this.displayName,
    this.address,
    this.boundingbox,
    this.distance,
  });

  factory FuelStationDetails.fromJson(Map<String, dynamic> json) =>
      FuelStationDetails(
        placeId: json["place_id"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        fuelStationClass: json["class"],
        type: json["type"],
        tagType: json["tag_type"],
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
        "class": fuelStationClass,
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
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
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
