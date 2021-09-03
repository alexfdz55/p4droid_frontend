import 'package:cell_calendar/cell_calendar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:p4droid_frontend/shared/helpers/funtions_time.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:p4droid_frontend/shared/theme/colors.dart';
import 'package:p4droid_frontend/shared/widgets/button_azul.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';

Map<String, String> _mesesEsp = {
  "January": "Enero",
  "February": "Febrero",
  "March": " Marzo",
  "April": " Abril",
  "May": " Mayo",
  "June": " Junio",
  "July": " Julio",
  "August": " Agosto",
  "September": " Septiembre",
  "October": " Octubre",
  "November": " Noviembre",
  "December": " Diciembre",
};

class CalendarMonthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      builder: (_) => CellCalendar(
        cellCalendarPageController: cellCalendarPageController,
        events: _.citasEventMonth,
        daysOfTheWeekBuilder: (dayIndex) {
          final labels = ["Dom", "Lun", "Mar", "Mier", "Jue", "Vier", "Sab"];
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              labels[dayIndex],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        monthYearLabelBuilder: (datetime) {
          final year = datetime!.year.toString();
          final month = _mesesEsp[datetime.month.monthName];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  "$month  $year",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    cellCalendarPageController.animateToDate(
                      DateTime.now(),
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                )
              ],
            ),
          );
        },
        onCellTapped: (date) {
          final eventsOnTheDate = _.citasEventMonth.where((event) {
            final eventDate = event.eventDate;
            return eventDate.year == date.year &&
                eventDate.month == date.month &&
                eventDate.day == date.day;
          }).toList();
          Get.dialog(
            AlertDialog(
              title: Text(
                //DateFormat("MMMM EEEE dd").format(date),
                DateFormat("MMMMEEEEd").format(date),
                // _mesesEsp[date.month.monthName].toString() +
                //     " " + date.day +
                //     date.day.toString(),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: eventsOnTheDate
                    .map(
                      (event) => InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: event.eventBackgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          //height: 30,
                          width: double.infinity,
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(bottom: 15),

                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Paciente:  ',
                                      style: TextStyle(
                                          color: event.eventTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${event.cita.user.name} ${event.cita.user.lastName}',
                                      style: TextStyle(
                                          color: event.eventTextColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Cédula:  ',
                                      style: TextStyle(
                                          color: event.eventTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${event.cita.user.cedula}',
                                      style: TextStyle(
                                          color: event.eventTextColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Estudio:  ',
                                      style: TextStyle(
                                          color: event.eventTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${event.cita.estudio.name}',
                                      style: TextStyle(
                                          color: event.eventTextColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
              actions: [
                ButtonAzul(
                  height: 30,
                  paddingV: 3,
                  fontSize: 16,
                  title: 'Agendar Nueva Cita',
                  onPressed: () {
                    Get.back();
                    _.date = date;
                    // Get.to(AgendarCitaPage());
                  },
                ),
              ],
            ),
          );
        },
        onPageChanged: (firstDate, lastDate) {
          /// Called when the page was changed
          /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
        },
      ),
    );
  }
}

class CalendarCitatMonth extends CalendarEvent {
  CalendarCitatMonth({
    required this.cita,
  }) : super(
          eventDate: convertStringToDateTime(cita.day),
          eventName: cita.user.name,
          eventID: cita.uid,
          eventBackgroundColor: kprimaryColor,
        );
  final Cita cita;
}
