




import 'dart:convert';



DailyQuotesModel dailyQuotesModelFromJson(String str) => DailyQuotesModel.fromJson(json.decode(str));

String dailyQuotesModelToJson(DailyQuotesModel data) => json.encode(data.toJson());

class DailyQuotesModel {
  bool? status;
  String? message;
  int? code;
  List<DailyQuotesList>? data;

  DailyQuotesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory DailyQuotesModel.fromJson(Map<String, dynamic> json) => DailyQuotesModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<DailyQuotesList>.from(json["data"]!.map((x) => DailyQuotesList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DailyQuotesList {
  int? id;
  String? title;
  String? subtitle;
  DateTime? date;
  bool? isFav;

  DailyQuotesList({
    this.id,
    this.title,
    this.subtitle,
    this.date,
    this.isFav,
  });

  factory DailyQuotesList.fromJson(Map<String, dynamic> json) => DailyQuotesList(
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
