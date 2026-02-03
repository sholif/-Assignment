

import 'dart:convert';

DailyQuotesDetailsModel dailyQuotesDetailsModelFromJson(String str) => DailyQuotesDetailsModel.fromJson(json.decode(str));

String dailyQuotesDetailsModelToJson(DailyQuotesDetailsModel data) => json.encode(data.toJson());

class DailyQuotesDetailsModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  DailyQuotesDetailsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory DailyQuotesDetailsModel.fromJson(Map<String, dynamic> json) => DailyQuotesDetailsModel(
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
  int? id;
  String? title;
  String? subtitle;
  String? date;
  bool? isFav;

  Data({
    this.id,
    this.title,
    this.subtitle,
    this.date,
    this.isFav,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    date: json["date"],
    isFav: json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "date": date,
    "isFav": isFav,
  };
}
