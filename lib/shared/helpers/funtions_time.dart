import 'package:get/get.dart';
import 'package:intl/intl.dart';

Duration convertHourStringToDuration(String hour) {
  final posH = hour.indexOf(':');
  late int hourInt;
  if (hour.contains('p.m.') && int.parse(hour.substring(0, posH)) != 12) {
    hourInt = int.parse(hour.substring(0, posH)) + 12;
  } else {
    hourInt = int.parse(hour.substring(0, posH));
  }

  final minInt = int.parse(hour.substring(posH + 1, (posH + 3)));
  //print(Duration(hours: hourInt, minutes: minInt));

  return Duration(hours: hourInt, minutes: minInt);
}

//Antes de agregar la parte de detectar los slots ocupados
// List<String> generarHorarios({
//   Estudio? estudio,
//   Subcategory? subcategory,
// }) {
//   List<String> horarios = [];
//   late String tStart;
//   late String tEnd;
//   late Duration rango;

//   if (estudio != null) {
//     tStart = estudio.timeStart!;
//     tEnd = estudio.timeEnd!;
//     rango = estudio.range.toInt().minutes;
//   }
//   //
//   else if (subcategory != null) {
//     print(subcategory.name);
//     tStart = subcategory.timeStart;
//     tEnd = subcategory.timeEnd;
//     rango = subcategory.range.toInt().minutes;
//   }
//   //Para obtener la hora de inicio y final en tipo Duration
//   final initHour = convertHourStringToDuration(tStart);
//   //Duration(hours: 7, minutes: 0);
//   var hour = initHour;
//   final finalHour = convertHourStringToDuration(tEnd);
//   //Duration(hours: 17, minutes: 0);
//   horarios.add(initHour.toString().substring(0, 4) + ' a.m.');

//   while (hour.inHours < finalHour.inHours) {
//     final index = hour.toString().indexOf(':', 3);
//     hour = hour + rango;
//     if (hour.inHours >= 13) {
//       final hour12 = hour - 12.hours;
//       horarios.add(hour12.toString().substring(0, index - 1) + ' p.m.');
//     }
//     //
//     else {
//       horarios.add(hour.toString().substring(0, index) + ' a.m.');
//     }
//   }
//   //print(horarios);
//   return horarios;
// }

// Future<List<String>> generarHorarios({
//   Estudio? estudio,
//   Subcategory? subcategory,
//   List<String>? horariosOcupados,
// }) async {
//   List<String> horarios = [];
//   late String tStart;
//   late String tEnd;
//   late Duration rango;

//   if (estudio != null) {
//     tStart = estudio.timeStart!;
//     tEnd = estudio.timeEnd!;
//     rango = estudio.range.toInt().minutes;
//   }
//   //
//   else if (subcategory != null) {
//     print(subcategory.name);
//     tStart = subcategory.timeStart;
//     tEnd = subcategory.timeEnd;
//     rango = subcategory.range.toInt().minutes;
//   }
//   //Para obtener la hora de inicio y final en tipo Duration
//   final initHour = convertHourStringToDuration(tStart);
//   //Duration(hours: 7, minutes: 0);
//   var hour = initHour;
//   final finalHour = convertHourStringToDuration(tEnd);
//   //Duration(hours: 17, minutes: 0);
//   horarios.add(initHour.toString().substring(0, 4) + ' a.m.');

//   //Genera los horarios como una lista de Strings
//   while (hour.inHours < finalHour.inHours) {
//     final index = hour.toString().indexOf(':', 3);
//     hour = hour + rango;
//     if (hour.inHours >= 13) {
//       final hour12 = hour - 12.hours;
//       horarios.add(hour12.toString().substring(0, index - 1) + ' p.m.');
//     }
//     //
//     else {
//       horarios.add(hour.toString().substring(0, index) + ' a.m.');
//     }
//   }

//   List<String> horas = [];

//   //Quita las horas ocupadas
//   if (horariosOcupados != null) {
//     print('quitando las horas ocupadas');
//     for (var i = 0; i < horariosOcupados.length; i++) {
//       for (var j = 0; j < horarios.length; j++) {
//         if (horariosOcupados[i] == horarios[j]) {
//           horarios.remove(horarios[j]);
//         }
//       }
//     }
//   }

//   //print('horarios generados' + horas.toString());

//   return horarios;
// }

String convertDate(DateTime date) {
  return DateFormat('dd/MM/yyyy', 'es').format(date);
}

DateTime convertStringToDateTime(String dateString) {
  final date = dateString.substring(6, 10) +
      '-' +
      dateString.substring(3, 5) +
      '-' +
      dateString.substring(0, 2);
  return DateTime.parse(date);
}
