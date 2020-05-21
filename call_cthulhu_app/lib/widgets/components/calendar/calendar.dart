import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//Make that stateful and add controllers/events
// https://pub.dev/packages/table_calendar
// https://pub.dev/documentation/table_calendar/latest/
class Calendar extends StatelessWidget {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TableCalendar(
        calendarController: _calendarController,
        initialSelectedDay: DateTime.now(),
        initialCalendarFormat: CalendarFormat.twoWeeks,
        startDay: DateTime.now(),
        availableCalendarFormats: {CalendarFormat.twoWeeks: '2 weeks'},
        headerStyle: HeaderStyle(
          centerHeaderTitle: true
        ),
      ),
    );
  }
}
