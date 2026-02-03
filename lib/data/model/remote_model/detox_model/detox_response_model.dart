
import 'dart:convert';


DetoxResponseModel detoxResponseModelFromJson(String str) => DetoxResponseModel.fromJson(json.decode(str));

String detoxResponseModelToJson(DetoxResponseModel data) => json.encode(data.toJson());

class DetoxResponseModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  DetoxResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory DetoxResponseModel.fromJson(Map<String, dynamic> json) => DetoxResponseModel(
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
  String? totalDetoxDuration;
  double? progress;

  Data({
    this.totalDetoxDuration,
    this.progress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalDetoxDuration: json["total_detox_duration"],
    progress: json["progress"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "total_detox_duration": totalDetoxDuration,
    "progress": progress,
  };
}
