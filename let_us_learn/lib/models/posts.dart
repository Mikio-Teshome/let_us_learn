// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.name,
    this.gener,
    this.imageUrl,
    this.pdfUrl,
  });

  String name;
  String gener;
  String imageUrl;
  String pdfUrl;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        gener: json["gener"],
        imageUrl: json["image_url"],
        pdfUrl: json["pdf_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gener": gener,
        "image_url": imageUrl,
        "pdf_url": pdfUrl,
      };
}
