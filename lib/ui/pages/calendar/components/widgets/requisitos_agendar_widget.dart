// import 'package:centro_ultrasonido/ui/pages_adm/calendar/controller/calendar_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RequisitosAgendarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CalendarController>(
//       init: CalendarController(),
//       builder: (_) => Container(
//         padding: EdgeInsets.only(left: 20),
//         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           color: Colors.grey.withOpacity(0.3),
//           // boxShadow: <BoxShadow>[
//           //   BoxShadow(
//           //       color: Colors.grey,
//           //       blurRadius: 1.0,
//           //       spreadRadius: 1.0,
//           //       offset: Offset(1.0, 4.0))
//           // ],
//         ),
//         child: TextField(
//           controller: _.requisitosTextController,
//           minLines: 3,
//           keyboardType: TextInputType.multiline,
//           maxLines: null,
//           style: TextStyle(
//               fontSize: 17, color: Colors.black //Theme.of(context).hintColor,
//               ),
//           decoration: InputDecoration(border: InputBorder.none),
//         ),
//       ),
//     );
//   }
// }
