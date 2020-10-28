// To parse this JSON data, do
//
//     final postDetail = postDetailFromJson(jsonString);

import 'dart:convert';

PostDetail postDetailFromJson(String str) =>
    PostDetail.fromJson(json.decode(str));

String postDetailToJson(PostDetail data) => json.encode(data.toJson());

class PostDetail {
  PostDetail({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostDetail.fromJson(Map<String, dynamic> json) => PostDetail(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
