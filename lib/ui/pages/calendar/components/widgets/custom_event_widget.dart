import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/ui/pages/calendar/controller/calendar_controller.dart';
import 'package:timetable/timetable.dart';

class CustomEventWidget extends StatelessWidget {
  final BasicEvent event;
  final VoidCallback onTap;
  CustomEventWidget({required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
        init: CalendarController(),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(right: 1),
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 0.75,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.hardEdge,
              color: event.backgroundColor,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4, 2, 4, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    child: Text(
                      'text',
                      style: TextStyle(color: Get.textTheme.bodyText1!.color),
                    ),
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
