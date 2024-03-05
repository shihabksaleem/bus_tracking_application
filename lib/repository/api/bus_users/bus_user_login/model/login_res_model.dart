class LoginResModel {
  String? token;

  LoginResModel({
    this.token,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
