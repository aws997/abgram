// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
    User({
        this.id,
        this.username,
        this.email,
        this.password,
        this.profilePic,
        this.coverPic,
        this.followers,
        this.follwoings,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    String? username;
    String? email;
    String? password;
    String? profilePic;
    String? coverPic;
    List<dynamic>? followers;
    List<dynamic>? follwoings;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        profilePic: json["profilePic"],
        coverPic: json["coverPic"],
        followers: json["followers"] == null ? [] : List<dynamic>.from(json["followers"]!.map((x) => x)),
        follwoings: json["follwoings"] == null ? [] : List<dynamic>.from(json["follwoings"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "profilePic": profilePic,
        "coverPic": coverPic,
        "followers": followers == null ? [] : List<dynamic>.from(followers!.map((x) => x)),
        "follwoings": follwoings == null ? [] : List<dynamic>.from(follwoings!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
