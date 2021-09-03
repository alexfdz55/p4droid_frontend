class Estudio {
  Estudio({
    required this.description,
    required this.img,
    required this.discount,
    required this.range,
    // required this.requirements,
    this.ayuna,
    required this.vejiga,
    this.timeStart,
    this.timeEnd,
    this.id,
    this.uid,
    required this.name,
    required this.price,
    //this.category
  });

  String description;
  String img;
  double discount;
  double range;
  // String requirements;
  String? id;
  String? uid;
  bool? ayuna;
  bool? vejiga;
  String? timeStart;
  String? timeEnd;
  String name;
  double price;
//  Category? category;

  factory Estudio.fromJson(Map<String, dynamic> json) => Estudio(
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
        id: json["_id"],
        name: json["name"],
        price: json["price"] / 1,
        //   category: Category.fromJson(json["category"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "description": description,
  //       "img": img,
  //       "_id": id,
  //       "name": name,
  //     };
}
