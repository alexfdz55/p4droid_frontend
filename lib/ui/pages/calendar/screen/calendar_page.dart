import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/routes/routes.dart';
import 'package:p4droid_frontend/shared/models/citas.dart';
import 'package:p4droid_frontend/shared/widgets/custom_circular_progress.dart';
import 'package:p4droid_frontend/shared/widgets/menu_lateral.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/calendar_month_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/ver_info_cita_dialog.dart';
import 'package:p4droid_frontend/ui/pages/calendar/components/widgets/custom_event_widget.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:p4droid_frontend/ui/pages/calendar/screen/agendar_cita_page.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';
import 'package:supercharged/supercharged.dart';
import 'package:timetable/timetable.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  var _visibleDateRange = PredefinedVisibleDateRange.week;

  bool get _isRecurringLayout =>
      _visibleDateRange == PredefinedVisibleDateRange.fixed;

  late final _dateController =
      DateController(visibleRange: _visibleDateRange.visibleDateRange);

  final _timeController = TimeController(
      minDuration: Duration(minutes: 5),
      //initialRange: TimeRange(Duration(hours: 8), Duration(hours: 10)),
      maxRange: TimeRange(Duration(hours: 6, minutes: 50), 18.hours));

  final _draggedEvents = <BasicEvent>[];

  @override
  void dispose() {
    _timeController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  late Color kColor;
  late Color textColor;

  bool estadoCalendario = false; //0->Semana // 1- Mes

  final pageRoutesSistema = generateRoutesSistema();

  @override
  Widget build(BuildContext context) {
    kColor = Theme.of(context).canvasColor;
    textColor = Get.textTheme.bodyText1!.color!;
    return GetBuilder<CalendarController>(
        init: CalendarController(),
        builder: (_) {
          _.context = context;
          return Scaffold(
            drawer: MenuLateral(),
            appBar: AppBar(
              title: Text('P4Droid'),
              actions: [
                IconButton(
                  icon: Icon(Icons.refresh,
                      color: isDark ? textColor : Colors.white),
                  onPressed: () => _.refreshPage(),
                  tooltip: 'Actualizar',
                ),
                TextButton(
                  child: Text(
                    estadoCalendario ? 'Ver por semana' : 'Ver por mes',
                    style: TextStyle(color: isDark ? textColor : Colors.white),
                  ),
                  onPressed: () {
                    estadoCalendario = !estadoCalendario;
                    setState(() {});
                  },
                ),
                PopupMenuButton<String>(
                  color: Get.theme.canvasColor,
                  onSelected: handleClick,
                  itemBuilder: (BuildContext context) {
                    return {
                      pageRoutesSistema[0].titulo,
                      pageRoutesSistema[1].titulo,
                      pageRoutesSistema[2].titulo,
                      pageRoutesSistema[3].titulo
                    }.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
                // Icon(Icons.more_vert),
                // SizedBox(width: 10)
              ],
            ),
            body: estadoCalendario
                ? CalendarMonthPage()
                : TimetableConfig<BasicEvent>(
                    dateController: _dateController,
                    timeController: _timeController,
                    eventBuilder: (context, event) => CustomEventWidget(
                        event: event, onTap: () => verInfoCitaEvento(event, _)),
                    child: Column(children: [
                      _showMonthAndOptions(_),
                      //_buildAppBar(), //Calendario de arriba
                      Expanded(
                        child: _isRecurringLayout
                            ? RecurringMultiDateTimetable<BasicEvent>()
                            : MultiDateTimetable<BasicEvent>(),
                      ),
                    ]),
                    eventProvider: eventProviderFromFixedList(_.citasEvent),
                    // allDayEventBuilder: (context, event, info) =>
                    //     BasicAllDayEventWidget(
                    //   event,
                    //   info: info,
                    //   onTap: () =>
                    //       _showSnackBar('All-day event $event tapped'),
                    // ),
                    // timeOverlayProvider: mergeTimeOverlayProviders([
                    //   // zonaNoLaborable,
                    //   //Lo que permite arrastrar los eventos
                    //   // (context, date) => _draggedEvents
                    //   //     .map((it) => it.toTimeOverlay(
                    //   //         date: date, widget: BasicEventWidget(it)))
                    //   //     .whereNotNull()
                    //   //     .toList(),
                    // ]),
                    callbacks: TimetableCallbacks(
                      onWeekTap: (week) {
                        _showSnackBar('Semana seleccionada $week.');
                        _updateVisibleDateRange(
                            PredefinedVisibleDateRange.week);
                        _dateController.animateTo(
                          week.getDayOfWeek(DateTime.monday),
                          vsync: this,
                        );
                      },
                      onDateTap: (date) => agendarCita(date, _),
                      // {
                      //   _showSnackBar('Fecha seleccionada: ' + convertDate(date));
                      //   _dateController.animateTo(date, vsync: this);
                      // },
                      onDateBackgroundTap: (date) =>
                          _showSnackBar('Tapped on date background at $date.'),
                      onDateTimeBackgroundTap: (date) => agendarCita(date, _),
                      //  (date) =>
                      //     _showSnackBar('Fecha sin cita:' + convertDate(date)),
                    ),
                    theme: TimetableThemeData(
                      context,
                      startOfWeek: DateTime.monday,
                      // dateDividersStyle: DateDividersStyle(
                      //   context,
                      //   color: Colors.blue.withOpacity(.3),
                      //   width: 2,
                      // ),
                      dateHeaderStyleProvider: (date) => DateHeaderStyle(
                        context,
                        date,
                        tooltip: 'Día de hoy',
                      ),
                      monthIndicatorStyleProvider: (date) =>
                          MonthIndicatorStyle(context, date,
                              label: DateFormat("MMMM").format(date).capitalize,
                              textStyle: TextStyle(
                                  color: textColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),

                      // See the "Theming" section below for more.
                    ),
                  ),
            // floatingActionButton: FloatingActionButton(
            //     backgroundColor: kprimaryColor,
            //     child: Icon(FontAwesomeIcons.calendarPlus, size: 30),
            //     onPressed: () {
            //       _.apiGetCitasOcupadas();
            //       // _.citasEvent.add(CitaEvent(
            //       //   id: 'q32',
            //       //   date: DateTime(2021, 8, 30),
            //       //   patientName: 'yo',
            //       //   start: Duration(hours: 8, minutes: 50),
            //       //   end: Duration(hours: 9, minutes: 0),
            //       // ));
            //       // setState(() {});
            //     }),
          );
        });
  }

  void handleClick(String value) {
    for (var route in pageRoutesSistema) {
      if (route.titulo == value) {
        Get.to(route.page);
      }
    }
  }

  agendarCita(DateTime date, CalendarController _) {
    _.reiniciarCampos();
    _.date = date;
    Get.to(AgendarCitaPage());
  }

  void _updateVisibleDateRange(PredefinedVisibleDateRange newValue) {
    setState(() {
      _visibleDateRange = newValue;
      _dateController.visibleRange = newValue.visibleDateRange;
    });
  }

  verInfoCitaEvento(BasicEvent event, CalendarController _) {
    late Cita citaSelect;
    for (var c in _.citas) {
      if (c.uid == event.id) {
        citaSelect = c;
      }
    }
    dialogVerInfoCita(citaSelect, _);
    //_showSnackBar('Cita agendada: $event tapped');
  }

  Widget _showMonthAndOptions(CalendarController _) {
    final colorScheme = Theme.of(context).colorScheme;
    Widget child = Container(
      padding: EdgeInsets.only(left: 10),
      color: Theme.of(context).canvasColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //   _isRecurringLayout
          //  ? null
          MonthIndicator.forController(_dateController),

          IconButton(
            icon: Icon(Icons.today, color: textColor),
            onPressed: () {
              _dateController.animateToToday(vsync: this);
              //_timeController.animateToShowFullDay(vsync: this);
            },
            tooltip: 'Ir al día de hoy',
          ),
          SizedBox(width: 8),
          DropdownButton<PredefinedVisibleDateRange>(
            onChanged: (visibleRange) => _updateVisibleDateRange(visibleRange!),
            value: _visibleDateRange,
            items: [
              for (final visibleRange in PredefinedVisibleDateRange.values)
                DropdownMenuItem(
                  value: visibleRange,
                  child: Text(visibleRange.title,
                      style: TextStyle(color: textColor)),
                ),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
    );

    if (!_isRecurringLayout) {
      child = Column(children: [
        child,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Builder(builder: (context) {
            return DefaultTimetableCallbacks(
                callbacks: DefaultTimetableCallbacks.of(context)!.copyWith(
                  onDateTap: (date) {
                    _showSnackBar('Fecha sin cita date $date.');
                    _updateVisibleDateRange(PredefinedVisibleDateRange.day);
                    _dateController.animateTo(date, vsync: this);
                  },
                ),
                child: Container() //CompactMonthTimetable(),
                );
          }),
        ),
      ]);
    }

    return Material(color: colorScheme.onSurface, elevation: 4, child: child);
  }

  void _showSnackBar(String content) {
    Get.snackbar('Info', content, snackPosition: SnackPosition.BOTTOM);
  }
}

enum PredefinedVisibleDateRange { day, week, fixed }

extension on PredefinedVisibleDateRange {
  VisibleDateRange get visibleDateRange {
    switch (this) {
      case PredefinedVisibleDateRange.day:
        return VisibleDateRange.days(1);
      // case PredefinedVisibleDateRange.threeDays:
      //   return VisibleDateRange.days(3);
      // case PredefinedVisibleDateRange.workWeek:
      //   return VisibleDateRange.weekAligned(5);
      case PredefinedVisibleDateRange.week:
        return VisibleDateRange.weekAligned(6, firstDay: DateTime.monday);
      case PredefinedVisibleDateRange.fixed:
        return VisibleDateRange.fixed(
          DateTimeTimetable.today(),
          DateTime.daysPerWeek,
        );
    }
  }

  String get title {
    switch (this) {
      case PredefinedVisibleDateRange.day:
        return 'Día';
      // case PredefinedVisibleDateRange.threeDays:
      //   return 'Mostrar 3 días';
      // case PredefinedVisibleDateRange.workWeek:
      //   return 'Mostrar 5 días';
      case PredefinedVisibleDateRange.week:
        return 'Semana laborable';
      case PredefinedVisibleDateRange.fixed:
        return 'Semana a partir de hoy';
    }
  }
}
