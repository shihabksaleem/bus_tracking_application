class AOwnersListResModel {
  int? status;
  List<AOwnerDetails>? owners;

  AOwnersListResModel({
    this.status,
    this.owners,
  });

  factory AOwnersListResModel.fromJson(Map<String, dynamic> json) =>
      AOwnersListResModel(
        status: json["status"],
        owners: json["data"] == null
            ? []
            : List<AOwnerDetails>.from(
                json["data"]!.map((x) => AOwnerDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": owners == null
            ? []
            : List<dynamic>.from(owners!.map((x) => x.toJson())),
      };
}

class AOwnerDetails {
  int? id;
  String? username;
  String? proof;
  String? phone;
  String? name;
  String? address;
  bool? isApproved;

  AOwnerDetails({
    this.id,
    this.username,
    this.proof,
    this.phone,
    this.name,
    this.address,
    this.isApproved,
  });

  factory AOwnerDetails.fromJson(Map<String, dynamic> json) => AOwnerDetails(
        id: json["id"],
        username: json["username"],
        proof: json["proof"],
        phone: json["phone"],
        name: json["name"],
        address: json["address"],
        isApproved: json["is_approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "proof": proof,
        "phone": phone,
        "name": name,
        "address": address,
        "is_approved": isApproved,
      };
}
