

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  UserProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
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
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;
  String? role;
  Notification? notification;
  MoreInfo? moreInfo;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
    this.role,
    this.notification,
    this.moreInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    avatar: json["avatar"],
    role: json["role"],
    notification: json["notification"] == null ? null : Notification.fromJson(json["notification"]),
    moreInfo: json["more_info"] == null ? null : MoreInfo.fromJson(json["more_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "avatar": avatar,
    "role": role,
    "notification": notification?.toJson(),
    "more_info": moreInfo?.toJson(),
  };
}

class MoreInfo {
  int? journals;
  int? completedGoals;
  int? totalGoals;
  String? totalDetox;

  MoreInfo({
    this.journals,
    this.completedGoals,
    this.totalGoals,
    this.totalDetox,
  });

  factory MoreInfo.fromJson(Map<String, dynamic> json) => MoreInfo(
    journals: json["journals"],
    completedGoals: json["completed_goals"],
    totalGoals: json["total_goals"],
    totalDetox: json["total_detox"],
  );

  Map<String, dynamic> toJson() => {
    "journals": journals,
    "completed_goals": completedGoals,
    "total_goals": totalGoals,
    "total_detox": totalDetox,
  };
}

class Notification {
  bool? pushNotification;
  bool? mailNotification;

  Notification({
    this.pushNotification,
    this.mailNotification,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    pushNotification: json["push_notification"],
    mailNotification: json["mail_notification"],
  );

  Map<String, dynamic> toJson() => {
    "push_notification": pushNotification,
    "mail_notification": mailNotification,
  };
}
