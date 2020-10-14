// To parse this JSON data, do
//
//     final aesPosts = aesPostsFromJson(jsonString);

import 'dart:convert';

List<AesPosts> aesPostsFromJson(String str) =>
    List<AesPosts>.from(json.decode(str).map((x) => AesPosts.fromJson(x)));

String aesPostsToJson(List<AesPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AesPosts {
  AesPosts({
    this.id,
    this.answer,
    this.userName,
  });

  String id;
  String answer;
  String userName;

  factory AesPosts.fromJson(Map<String, dynamic> json) => AesPosts(
        id: json["id"],
        answer: json["answer"],
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "UserName": userName,
      };
}
