class PassengerLoginResModel {
  String? token;

  PassengerLoginResModel({
    this.token,
  });

  factory PassengerLoginResModel.fromJson(Map<String, dynamic> json) => PassengerLoginResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
