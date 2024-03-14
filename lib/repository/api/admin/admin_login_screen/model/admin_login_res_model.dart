class AdminLoginResModel {
  String? token;

  AdminLoginResModel({this.token});

  factory AdminLoginResModel.fromJson(Map<String, dynamic> json) =>
      AdminLoginResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
