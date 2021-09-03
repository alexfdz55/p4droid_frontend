class Category {
  Category({
    required this.description,
    this.img,
    this.uid,
    required this.name,
    this.id,
    this.v,
  });

  String description;
  String? img;
  String? uid;
  String? id;
  String name;
  String? v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        description: json["description"],
        img: json["img"],
        uid: json["uid"],
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "img": img,
        "_id": id,
        "uid": uid,
        "name": name,
        "v": v
      };
}



// // To parse this JSON data, do
// //
// //     final Category = usuarioFromJson(jsonString);

// import 'dart:convert';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

// class Category {
//   Category({
//     // required this.description,
//     // required this.image,
//     //  required this.id,
//     required this.name,
//   });

//   // String description;
//   //String image;
//   // String id;
//   String name;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         // description: json["description"],
//         // image: json["image"],
//         // id: json["_id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         // "description": description,
//         //"image": image,
//         //  "_id": id,
//         "name": name,
//       };
// }
