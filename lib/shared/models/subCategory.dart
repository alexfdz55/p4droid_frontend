import 'package:p4droid_frontend/shared/models/category.dart';

class Subcategory {
  Subcategory({
    this.description,
    required this.img,
    required this.discount,
    required this.range,
    // required this.requirements,
    required this.ayuna,
    required this.vejiga,
    required this.timeStart,
    required this.timeEnd,
    required this.uid,
    required this.name,
    required this.price,
    this.category,
  });

  String? description;
  String img;
  double discount;
  double range;
  // String requirements;
  bool ayuna;
  bool vejiga;
  String timeStart;
  String timeEnd;
  String uid;
  String name;
  double price;
  Category? category;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        description: json["description"],
        img: json["img"],
        discount: json["discount"] / 1,
        range: json["range"] / 1,
        // requirements: json["requirements"],
        ayuna: json["ayuna"],
        vejiga: json["vejiga"],
        timeStart: json["time_start"],
        timeEnd: json["time_end"],
        uid: json["uid"],

        name: json["name"],
        price: json["price"] / 1,
        //  category: Category?.fromJson(json["category"])
        category: Category?.fromJson(json["category"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "description": description,
  //       "img": img,
  //       "_id": id,
  //       "name": name,
  //     };
}
