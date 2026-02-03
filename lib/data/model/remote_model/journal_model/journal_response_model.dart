

import 'dart:convert';

JournalResponseModel journalResponseModelFromJson(String str) => JournalResponseModel.fromJson(json.decode(str));

String journalResponseModelToJson(JournalResponseModel data) => json.encode(data.toJson());

class JournalResponseModel {
  bool? status;
  String? message;
  int? code;
  List<JournalListData>? data;
  Pagination? pagination;

  JournalResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
    this.pagination,
  });

  factory JournalResponseModel.fromJson(Map<String, dynamic> json) => JournalResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<JournalListData>.from(json["data"]!.map((x) => JournalListData.fromJson(x))),
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

class JournalListData {
  int? id;
  String? title;
  DateTime? date;
  String? description;
  String? audioDuration;
  String? category;
  int? imageCount;
  int? videoCount;

  JournalListData({
    this.id,
    this.title,
    this.date,
    this.description,
    this.audioDuration,
    this.category,
    this.imageCount,
    this.videoCount,
  });

  factory JournalListData.fromJson(Map<String, dynamic> json) => JournalListData(
    id: json["id"],
    title: json["title"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    audioDuration: json["audio_duration"],
    category: json["category"],
    imageCount: json["image_count"],
    videoCount: json["video_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date": date?.toIso8601String(),
    "description": description,
    "audio_duration": audioDuration,
    "category": category,
    "image_count": imageCount,
    "video_count": videoCount,
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
