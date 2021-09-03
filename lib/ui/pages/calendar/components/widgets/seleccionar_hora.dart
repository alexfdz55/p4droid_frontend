// import 'package:centro_ultrasonido/ui/pages_adm/calendar/controller/calendar_controller.dart';
// import 'package:flutter/material.dart';

// import 'package:centro_ultrasonido/shared/widgets/custom_container.dart';

// import 'package:get/get.dart';

// class SeleccionarHoraWidget extends StatelessWidget {
//   String? _selectedTime;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CalendarController>(
//       init: CalendarController(),
//       id: 'select_hour',
//       builder: (_) => InkWell(
//         child: CustomContainer(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _.hour.length == 0
//                 ? Text(
//                     'Seleccionar Hora',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.black38,
//                     ),
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Hora:  ',
//                         style: TextStyle(fontSize: 17, color: Colors.black38),
//                       ),
//                       Text(
//                         _.hour,
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//             SizedBox(width: 60),
//             Icon(
//               Icons.watch_later_rounded,
//               color: Theme.of(context).primaryColor,
//             )
//           ],
//         )),
//         onTap: () => _show(context, _),
//       ),
//     );
//   }

//   Future<void> _show(BuildContext context, CalendarController _) async {
//     final TimeOfDay? result = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(_.date),
//     );
//     if (result != null) {
//       if (result.hour == 12) {
//         _.hour = result.format(context) + ':PM';
//       } else if (result.hour > 12) {
//         _.hour = result.format(context);
//       } else {
//         _.hour = result.format(context) + ':AM';
//       }
//       _.update(['select_hour']);
//     }
//   }
// }
