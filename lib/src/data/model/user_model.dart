// To parse this JSON data, do
//
//     final USerModel = USerModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:domo/src/domain/entities/user_entities.dart';

USerModel USerModelFromJson(String str) => USerModel.fromJson(json.decode(str));

String USerModelToJson(USerModel data) => json.encode(data.toJson());

class USerModel extends UserEntities {
  USerModel({
    bool? accountComplete,
    bool? active,
    String? uid,
    int? typeUser,
  }) : super(
          accountComplete: accountComplete,
          active: active,
          uid: uid,
          typUser: typeUser,
        );

  factory USerModel.fromJson(Map<String, dynamic> json) => USerModel(
        accountComplete:
            (json["accountComplete"] == null) ? false : json["accountComplete"],
        active: (json["active"] == null) ? false : json["active"],
        uid: (json["uid"] == null) ? '' : json["uid"],
        typeUser: (json["typeUser"] == null) ? 0 : json["typeUser"],
      );

  Map<String, dynamic> toJson() => {
        "accountComplete": accountComplete,
        "active": active,
        "uid": uid,
        "typeUser": typUser,
      };
}
