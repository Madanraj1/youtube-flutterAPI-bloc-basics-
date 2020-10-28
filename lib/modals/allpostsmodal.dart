// To parse this JSON data, do
//
//     final allPosts = allPostsFromJson(jsonString);

import 'dart:convert';

List<AllPosts> allPostsFromJson(String str) =>
    List<AllPosts>.from(json.decode(str).map((x) => AllPosts.fromJson(x)));

String allPostsToJson(List<AllPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPosts {
  AllPosts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory AllPosts.fromJson(Map<String, dynamic> json) => AllPosts(
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
