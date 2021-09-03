import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';

class TimetWidget extends StatelessWidget {
  // String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      id: 'time_start',
      builder: (_) => InkWell(
        child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(left: 5),
            width: responsive.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _.timeStart.length == 0
                    ? Text(
                        'Hora',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hora:  ',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            _.timeStart,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: _.timeStart != '7:00 a.m.'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                SizedBox(width: 60),
                Icon(
                  Icons.watch_later_rounded,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )),
        onTap: () => _show(context, _),
      ),
    );
  }

  Future<void> _show(BuildContext context, CalendarController _) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      helpText: 'Seleccionar hora inicial',
      initialTime: TimeOfDay.fromDateTime(_.initHour),
    );
    if (result != null) {
      _.timeStart = result.format(context);
      // if (result.hour == 12) {
      //   _.hour = result.format(context) + ':PM';
      // } else if (result.hour > 12) {
      //   _.hour = result.format(context);
      // } else {
      //   _.hour = result.format(context) + ':AM';
      // }
      _.update(['time_start']);
    }
  }
}
