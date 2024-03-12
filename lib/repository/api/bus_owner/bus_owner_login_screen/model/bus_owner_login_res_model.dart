class BusOwnerLoginResModel {
  String? token;

  BusOwnerLoginResModel({this.token});

  factory BusOwnerLoginResModel.fromJson(Map<String, dynamic> json) =>
      BusOwnerLoginResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
