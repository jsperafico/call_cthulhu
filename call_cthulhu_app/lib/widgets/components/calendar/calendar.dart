import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final CalendarController calendarController;
  final Map<DateTime, List> events;
  final Function onDaySelected;

  Calendar(this.calendarController, this.events, this.onDaySelected);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TableCalendar(
        calendarController: this.calendarController,
        initialSelectedDay: DateTime.now(),
        initialCalendarFormat: CalendarFormat.twoWeeks,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        startDay: DateTime.now(),
        availableCalendarFormats: {CalendarFormat.twoWeeks: '2 weeks'},
        headerStyle: HeaderStyle(centerHeaderTitle: true),
        events: this.events,
        onDaySelected: this.onDaySelected,
      ),
    );
  }
}
