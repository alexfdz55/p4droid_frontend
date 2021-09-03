// To parse this JSON data, do
//
//     final Usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.img,
    this.role,
    // required this.state,
    required this.name,
    required this.lastName,
    required this.email,
    this.uid,
    this.id,
    this.birthdate,
    required this.cedula,
    required this.gender,
    this.address,
    required this.phone,
    required this.blood,
    //required  this.id,
  });

  String img;
  String? role;
  // bool state;
  String name;
  String lastName;
  String email;
  String? uid;
  String? id;

  String? birthdate;
  String cedula;
  String gender;
  String? address;
  String phone;
  String blood;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        img: json["img"],
        role: json["role"],
        // state: json["state"],
        name: json["name"],
        lastName: json["lastname"],
        email: json["email"],
        uid: json["uid"],
        id: json["_id"],
        //id: json["_id"],
        birthdate: json["birthdate"],
        cedula: json["cedula"],
        gender: json["gender"],
        address: json["address"],
        phone: json["phone"],
        blood: json["blood"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "role": role,
        // "state": state,
        "name": name,
        "lastname": lastName,
        "email": email,
        "uid": uid,
        //"_id": id,
        "birthdate": birthdate,
        "cedula": cedula,
        "gender": gender,
        "address": address,
        "phone": phone,
        "blood": blood,
      };
}
