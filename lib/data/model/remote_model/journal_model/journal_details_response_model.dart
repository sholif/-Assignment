// To parse this JSON data, do
//
//     final journalDetailsResponseModel = journalDetailsResponseModelFromJson(jsonString);

// import 'dart:convert';
//
// JournalDetailsResponseModel journalDetailsResponseModelFromJson(String str) => JournalDetailsResponseModel.fromJson(json.decode(str));
//
// String journalDetailsResponseModelToJson(JournalDetailsResponseModel data) => json.encode(data.toJson());
//
// class JournalDetailsResponseModel {
//   bool? status;
//   String? message;
//   int? code;
//   Data? data;
//
//   JournalDetailsResponseModel({
//     this.status,
//     this.message,
//     this.code,
//     this.data,
//   });
//
//   factory JournalDetailsResponseModel.fromJson(Map<String, dynamic> json) => JournalDetailsResponseModel(
//     status: json["status"],
//     message: json["message"],
//     code: json["code"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "code": code,
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   int? id;
//   String? title;
//   String? category;
//   DateTime? date;
//   String? description;
//   String? voice;
//   String? transcript;
//   List<Media>? media;
//
//   Data({
//     this.id,
//     this.title,
//     this.category,
//     this.date,
//     this.description,
//     this.voice,
//     this.transcript,
//     this.media,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     title: json["title"],
//     category: json["category"],
//     date: json["date"] == null ? null : DateTime.parse(json["date"]),
//     description: json["description"],
//     voice: json["voice"],
//     transcript: json["transcript"],
//     media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "category": category,
//     "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//     "description": description,
//     "voice": voice,
//     "transcript": transcript,
//     "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
//   };
// }
//
// class Media {
//   int? id;
//   String? file;
//   String? type;
//
//   Media({
//     this.id,
//     this.file,
//     this.type,
//   });
//
//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//     id: json["id"],
//     file: json["file"],
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "file": file,
//     "type": type,
//   };
// }



// To parse this JSON data, do
//
//     final journalDetailsResponseModel = journalDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

JournalDetailsResponseModel journalDetailsResponseModelFromJson(String str) => JournalDetailsResponseModel.fromJson(json.decode(str));

String journalDetailsResponseModelToJson(JournalDetailsResponseModel data) => json.encode(data.toJson());

class JournalDetailsResponseModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  JournalDetailsResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory JournalDetailsResponseModel.fromJson(Map<String, dynamic> json) => JournalDetailsResponseModel(
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
  String? category;
  DateTime? date;
  String? description;
  String? voice;
  String? duration;
  String? transcript;
  List<Media>? media;

  Data({
    this.id,
    this.title,
    this.category,
    this.date,
    this.description,
    this.voice,
    this.duration,
    this.transcript,
    this.media,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    voice: json["voice"],
    duration: json["duration"],
    transcript: json["transcript"],
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "description": description,
    "voice": voice,
    "duration": duration,
    "transcript": transcript,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  int? id;
  String? file;
  String? filePath;
  String? type;

  Media({
    this.id,
    this.file,
    this.filePath,
    this.type,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    file: json["file"],
    filePath: json["file_path"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "file_path": filePath,
    "type": type,
  };
}
