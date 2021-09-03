import 'package:p4droid_frontend/shared/models/estudio.dart';
import 'package:p4droid_frontend/shared/models/user.dart';

class Cita {
  Cita(
      {required this.type,
      required this.uid,
      required this.user,
      required this.estudio,
      required this.day,
      required this.hour});

  String type;
  String uid;

  Estudio estudio;
  Usuario user;
  String day;
  String hour;

  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        type: json["type"],
        uid: json["uid"],
        user: Usuario.fromJson(json["user"]),
        estudio: Estudio.fromJson(json["subcategory"]),
        day: json["day"],
        hour: json["hour"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "uid": uid,
        "user": user,
//"subcategory": subcategory,
        "day": day,
        "hour": hour,
      };
}
