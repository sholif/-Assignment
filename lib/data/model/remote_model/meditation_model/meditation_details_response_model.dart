



import 'dart:convert';

MeditationDetailsResponseModel meditationDetailsResponseModelFromJson(String str) => MeditationDetailsResponseModel.fromJson(json.decode(str));

String meditationDetailsResponseModelToJson(MeditationDetailsResponseModel data) => json.encode(data.toJson());

class MeditationDetailsResponseModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  MeditationDetailsResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory MeditationDetailsResponseModel.fromJson(Map<String, dynamic> json) => MeditationDetailsResponseModel(
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
  String? imagePath;
  String? audioPath;

  Data({
    this.id,
    this.title,
    this.category,
    this.imagePath,
    this.audioPath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    imagePath: json["image_path"],
    audioPath: json["audio_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "image_path": imagePath,
    "audio_path": audioPath,
  };
}
