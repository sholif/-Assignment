

// To parse this JSON data, do
//
//     final goalsResponseModel = goalsResponseModelFromJson(jsonString);

import 'dart:convert';

GoalsResponseModel goalsResponseModelFromJson(String str) => GoalsResponseModel.fromJson(json.decode(str));

String goalsResponseModelToJson(GoalsResponseModel data) => json.encode(data.toJson());

class GoalsResponseModel {
  bool? status;
  String? message;
  int? code;
  List<GoalsList>? data;

  GoalsResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GoalsResponseModel.fromJson(Map<String, dynamic> json) => GoalsResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<GoalsList>.from(json["data"]!.map((x) => GoalsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GoalsList {
  int? id;
  String? title;
  String? category;
  DateTime? expiresAt;
  String? status;
  int? progress;

  GoalsList({
    this.id,
    this.title,
    this.category,
    this.expiresAt,
    this.status,
    this.progress,
  });

  factory GoalsList.fromJson(Map<String, dynamic> json) => GoalsList(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
    status: json["status"],
    progress: json["progress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "expires_at": expiresAt?.toIso8601String(),
    "status": status,
    "progress": progress,
  };
}
