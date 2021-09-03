import 'dart:math';

import 'package:black_hole_flutter/black_hole_flutter.dart';

import 'package:flutter/material.dart';
import 'package:p4droid_frontend/shared/helpers/funtions_time.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:supercharged/supercharged.dart' hide DateTimeSC;
import 'package:timetable/timetable.dart';
import 'package:timetable/src/utils.dart';
import 'package:intl/intl.dart';

// A basic EventProvider containing a single event:
// eventProvider: EventProvider.list([
//   BasicEvent(
//     id: 0,
//     title: 'My Event',
//     color: Colors.blue,
//     start: LocalDate.today().at(LocalTime(13, 0, 0)),
//     end: LocalDate.today().at(LocalTime(15, 0, 0)),
//   ),
// ]),

// For a demo of overlapping events, use this one instead:
// eventProvider: positioningDemoEventProvider,

// Or even this short example using a Stream:
// eventProvider: EventProvider.stream(
//   eventGetter: (range) => Stream.periodic(
//     Duration(milliseconds: 16),
//     (i) {
//       final start =
//           LocalDate.today().atMidnight() + Period(minutes: i * 2);
//       return [
//         BasicEvent(
//           id: 0,
//           title: 'Event',
//           color: Colors.blue,
//           start: start,
//           end: start + Period(hours: 5),
//         ),
//       ];
//     },
//   ),
// ),

// _dateController.page.addListener(() {
//   print('New page: ${_dateController.page.value}');
// });
// _timeController.addListener(() {
//   print('New time range: ${_timeController.value}');
// });

// final positioningDemoEvents = <BasicEvent>[
//   _DemoEvent(0, 0, Duration(hours: 8), Duration(hours: 8, minutes: 30)),
//   _DemoEvent(0, 1, Duration(hours: 10), Duration(hours: 11)),
//   _DemoEvent(2, 1, Duration(hours: 10), Duration(hours: 12)),
//   _DemoEvent(-2, 4, Duration(hours: 13), Duration(hours: 15)),
// ];

// final positioningDemoEvents = <BasicEvent>[
//   BasicEvent(
//     id: '1',
//     title: 'Cita 1',
//     backgroundColor: Colors.red,
//     start: DateTime(2021, 8, 15, 8),
//     end: DateTime(2021, 8, 14, 9),
//   ),
//   BasicEvent(
//     id: '2',
//     title: 'Cita 2',
//     backgroundColor: Colors.green,
//     start: DateTime(2021, 8, 15, 10),
//     end: DateTime(2021, 8, 15, 11),
//   ),
// ];

// class _DemoEvent extends BasicEvent {
//   _DemoEvent(
//     int demoId,
//     int eventId,
//     Duration start,
//     Duration end, {
//     int endDateOffset = 0,
//   }) : super(
//           id: '$demoId-$eventId',
//           title: '$demoId-$eventId',
//           backgroundColor: _getColor('$demoId-$eventId'),
//           start: DateTime.now().toUtc().atStartOfDay + demoId.days + start,
//           end: DateTime.now().toUtc().atStartOfDay +
//               (demoId + endDateOffset).days +
//               end,
//         );

//   _DemoEvent.allDay(int id, int startOffset, int length)
//       : super(
//           id: 'a-$id',
//           title: 'a-$id',
//           backgroundColor: _getColor('a-$id'),
//           start: DateTime.now().toUtc().atStartOfDay + startOffset.days,
//           end:
//               DateTime.now().toUtc().atStartOfDay + (startOffset + length).days,
//         );

//   static Color _getColor(String id) {
//     return Random(id.hashCode)
//         .nextColorHsv(saturation: 0.6, value: 0.8, alpha: 1)
//         .toColor();
//   }
// }

// class CitaEvent extends BasicEvent {
//   CitaEvent({
//     // required String patientName,
//     //required String category,
//     required DateTime date,
//     required String patientName,
//     required String id,
//     // required int demoId,
//     // required int eventId,
//     required Duration start,
//     required Duration end,
//     int endDateOffset = 0,
//   }) : super(
//           id: id,
//           title: patientName,
//           backgroundColor: Colors.green,
//           start: date.toUtc().atStartOfDay + start,
//           end: date.toUtc().atStartOfDay + end,
//         );

//   CitaEvent.allDay(int id, int startOffset, int length)
//       : super(
//           id: 'a-$id',
//           title: 'a-$id',
//           backgroundColor: Colors.green, //_getColor('a-$id'),
//           start: DateTime.now().toUtc().atStartOfDay + startOffset.days,
//           end:
//               DateTime.now().toUtc().atStartOfDay + (startOffset + length).days,
//         );

//   // static Color _getColor(String id) {
//   //   return
//   //       //Genera un color al azar
//   //       Random(id.hashCode)
//   //           .nextColorHsv(saturation: 0.6, value: 0.8, alpha: 1)
//   //           .toColor();
//   // }
// }

class CitaEvent extends BasicEvent {
  final Cita cita;
  final BuildContext context;

  CitaEvent(
    this.cita,
    this.context, {
    int endDateOffset = 0,
  }) : super(
          id: cita.uid,
          title: cita.user.name,
          backgroundColor: Theme.of(context).primaryColor,
          start: DateFormat('dd/MM/yyyy').parse(cita.day).toUtc().atStartOfDay +
              convertHourStringToDuration(cita.hour),
          end: DateFormat('dd/MM/yyyy').parse(cita.day).toUtc().atStartOfDay +
              convertHourStringToDuration(cita.hour) +
              cita.estudio.range.minutes,
        );

  // CitaEvent.allDay(int id, int startOffset, int length)
  //     : super(
  //         id: 'a-$id',
  //         title: 'a-$id',
  //         backgroundColor: Colors.green, //_getColor('a-$id'),
  //         start: DateTime.now().toUtc().atStartOfDay + startOffset.days,
  //         end:
  //             DateTime.now().toUtc().atStartOfDay + (startOffset + length).days,
  //       );

  // static Color _getColor(String id) {
  //   return
  //       //Genera un color al azar
  //       Random(id.hashCode)
  //           .nextColorHsv(saturation: 0.6, value: 0.8, alpha: 1)
  //           .toColor();
  // }
}

List<TimeOverlay> zonaNoLaborable(
  BuildContext context,
  DateTime date,
) {
  assert(date.isValidTimetableDate);

  final widget =
      ColoredBox(color: context.theme.brightness.contrastColor.withOpacity(.1));

  if (DateTime.monday <= date.weekday && date.weekday <= DateTime.saturday) {
    return [
      TimeOverlay(start: 0.hours, end: 8.hours, widget: widget),
      TimeOverlay(start: 20.hours, end: 24.hours, widget: widget),
    ];
  } else {
    return [TimeOverlay(start: 0.hours, end: 24.hours, widget: widget)];
  }
}
