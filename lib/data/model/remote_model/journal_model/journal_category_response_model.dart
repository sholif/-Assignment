

// To parse this JSON data, do
//
//     final journalResponseModel = journalResponseModelFromJson(jsonString);

import 'dart:convert';

JournalCategoryResponseModel journalResponseModelFromJson(String str) => JournalCategoryResponseModel.fromJson(json.decode(str));

String journalResponseModelToJson(JournalCategoryResponseModel data) => json.encode(data.toJson());

class JournalCategoryResponseModel {
  bool? status;
  String? message;
  int? code;
  List<JournalTypListModel>? data;

  JournalCategoryResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory JournalCategoryResponseModel.fromJson(Map<String, dynamic> json) => JournalCategoryResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<JournalTypListModel>.from(json["data"]!.map((x) => JournalTypListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


class JournalTypListModel {
  int? id;
  String? name;

  JournalTypListModel({
    this.id,
    this.name,
  });

  factory JournalTypListModel.fromJson(Map<String, dynamic> json) => JournalTypListModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  // 👉 এই অংশটা নতুন করে যোগ করো
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is JournalTypListModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}


// class JournalTypListModel {
//   int? id;
//   String? name;
//
//   JournalTypListModel({
//     this.id,
//     this.name,
//   });
//
//   factory JournalTypListModel.fromJson(Map<String, dynamic> json) => JournalTypListModel(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }