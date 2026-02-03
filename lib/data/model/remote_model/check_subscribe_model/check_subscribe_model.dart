


// To parse this JSON data, do
//
//     final checkSubscribeResponseModel = checkSubscribeResponseModelFromJson(jsonString);

import 'dart:convert';

CheckSubscribeResponseModel checkSubscribeResponseModelFromJson(String str) => CheckSubscribeResponseModel.fromJson(json.decode(str));

String checkSubscribeResponseModelToJson(CheckSubscribeResponseModel data) => json.encode(data.toJson());

class CheckSubscribeResponseModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  CheckSubscribeResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory CheckSubscribeResponseModel.fromJson(Map<String, dynamic> json) => CheckSubscribeResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  int? userId;
  String? hasTrial;
  bool? isSubscribed;

  Data({
    this.userId,
    this.hasTrial,
    this.isSubscribed,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    hasTrial: json["has_trial"],
    isSubscribed: json["isSubscribed"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "has_trial": hasTrial,
    "isSubscribed": isSubscribed,
  };
}
