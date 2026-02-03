class PostDataModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? userName;
  String? userImage;
  bool? isBookmarked;

  PostDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.userName,
    this.userImage,
    this.isBookmarked,
  });

  PostDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userName = 'User ${json['userId']}';
    userImage = 'https://i.pravatar.cc/150?img=${json['userId']}';
    isBookmarked = false; // Default value
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['isBookmarked'] = this.isBookmarked ?? false;
    return data;
  }
}