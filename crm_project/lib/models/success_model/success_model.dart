import 'dart:convert';

SuccessModel successModelFromJson(String str) => SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  int statusCode;
  String message;

  SuccessModel({
    required this.statusCode,
    required this.message,
  });

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
    statusCode: json["statusCode"] ?? 0,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
  };
}
