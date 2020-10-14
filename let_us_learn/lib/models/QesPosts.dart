// To parse this JSON data, do
//
//     final qesPosts = qesPostsFromJson(jsonString);

import 'dart:convert';

List<QesPosts> qesPostsFromJson(String str) =>
    List<QesPosts>.from(json.decode(str).map((x) => QesPosts.fromJson(x)));

String qesPostsToJson(List<QesPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QesPosts {
  QesPosts({
    this.id,
    this.question,
    this.userName,
    this.genere,
  });

  String id;
  String question;
  String userName;
  String genere;

  factory QesPosts.fromJson(Map<String, dynamic> json) => QesPosts(
        id: json["id"],
        question: json["question"],
        userName: json["UserName"],
        genere: json["genere"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "UserName": userName,
        "genere": genere,
      };
}
