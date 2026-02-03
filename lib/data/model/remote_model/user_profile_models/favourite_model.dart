


// To parse this JSON data, do
//
//     final favouriteResponseModel = favouriteResponseModelFromJson(jsonString);

import 'dart:convert';

FavouriteResponseModel favouriteResponseModelFromJson(String str) => FavouriteResponseModel.fromJson(json.decode(str));

String favouriteResponseModelToJson(FavouriteResponseModel data) => json.encode(data.toJson());

class FavouriteResponseModel {
  bool? status;
  String? message;
  int? code;
  List<FavouriteList>? data;

  FavouriteResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory FavouriteResponseModel.fromJson(Map<String, dynamic> json) => FavouriteResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<FavouriteList>.from(json["data"]!.map((x) => FavouriteList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FavouriteList {
  int? id;
  String? title;
  String? subtitle;
  DateTime? date;
  bool? isFav;

  FavouriteList({
    this.id,
    this.title,
    this.subtitle,
    this.date,
    this.isFav,
  });

  factory FavouriteList.fromJson(Map<String, dynamic> json) => FavouriteList(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    isFav: json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "isFav": isFav,
  };
}
