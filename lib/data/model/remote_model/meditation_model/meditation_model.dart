

// To parse this JSON data, do
//
//     final meditationResponseModel = meditationResponseModelFromJson(jsonString);

import 'dart:convert';

MeditationResponseModel meditationResponseModelFromJson(String str) => MeditationResponseModel.fromJson(json.decode(str));

String meditationResponseModelToJson(MeditationResponseModel data) => json.encode(data.toJson());

class MeditationResponseModel {
  bool? status;
  String? message;
  int? code;
  List<MeditationListData>? data;
  Pagination? pagination;

  MeditationResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
    this.pagination,
  });

  factory MeditationResponseModel.fromJson(Map<String, dynamic> json) => MeditationResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<MeditationListData>.from(json["data"]!.map((x) => MeditationListData.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class MeditationListData {
  int? id;
  String? title;
  String? category;
  String? duration;
  String? imagePath;

  MeditationListData({
    this.id,
    this.title,
    this.category,
    this.duration,
    this.imagePath,
  });

  factory MeditationListData.fromJson(Map<String, dynamic> json) => MeditationListData(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    duration: json["duration"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "duration": duration,
    "image_path": imagePath,
  };
}

class Pagination {
  int? total;
  int? currentPage;
  int? perPage;
  int? lastPage;
  int? from;
  int? to;

  Pagination({
    this.total,
    this.currentPage,
    this.perPage,
    this.lastPage,
    this.from,
    this.to,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    currentPage: json["current_page"],
    perPage: json["per_page"],
    lastPage: json["last_page"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "current_page": currentPage,
    "per_page": perPage,
    "last_page": lastPage,
    "from": from,
    "to": to,
  };
}
