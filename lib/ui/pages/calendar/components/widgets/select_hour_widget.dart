// import 'package:centro_ultrasonido/ui/pages_adm/calendar/controller/calendar_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:centro_ultrasonido/shared/widgets/custom_container.dart';

// class SelectHourWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CalendarController>(
//       init: CalendarController(),
//       builder: (_) => CustomContainer(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Icon(
//               Icons.watch_later_rounded,
//               color: Theme.of(context).primaryColor,
//             ),
//             SizedBox(width: 15),
//             DropdownButton(
//               style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.black //Theme.of(context).hintColor,
//                   ),
//               icon: Icon(Icons.arrow_drop_down, size: 40, color: Colors.black),
//               value: _.hour,
//               items: _.dropDownHours,
//               onChanged: (value) {
//                 _.hour = value.toString();
//                 _.update();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
