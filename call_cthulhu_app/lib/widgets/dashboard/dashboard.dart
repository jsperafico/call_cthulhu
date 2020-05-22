import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/widgets/components/calendar/calendar.dart';
import 'package:call_cthulhu_app/widgets/dashboard/session_notification.dart';
import 'package:call_cthulhu_app/widgets/session/live_card.dart';
import 'package:call_cthulhu_app/widgets/session/session_card.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  CalendarController _calendarController;
  Map<DateTime, List> _events = {};
  List<SessionModel> _listSessionOfSelectedDay;

  Widget _portrait(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: LiveCard(),
        ),
        Container(
          width: double.infinity,
          child: Calendar(
            this._calendarController,
            this._events,
            this._onDaySelected,
          ),
        ),
        this._createListSessionCard(context),
      ],
    );
  }

  Widget _landscape(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LiveCard(),
              Calendar(
                this._calendarController,
                this._events,
                this._onDaySelected,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: this._createListSessionCard(context),
        ),
      ],
    );
  }

  void _onDaySelected(DateTime day, List titles) {
    setState(() {
      this._listSessionOfSelectedDay = Api.sessionsModel
          .where((item) => item.scheduled.difference(day).inDays == 0)
          .toList();
    });
  }

  Widget _createListSessionCard(BuildContext context) {
    return (this._listSessionOfSelectedDay == null ||
            this._listSessionOfSelectedDay.length == 0)
        ? Container()
        : Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SessionCard(this._listSessionOfSelectedDay[index]);
              },
              itemCount: this._listSessionOfSelectedDay.length,
            ),
          );
  }

  void _openNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: Api.sessionsNotifications.length,
          itemBuilder: (context, index) {
            return SessionNotification(Api.sessionsNotifications[index]);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this._calendarController = CalendarController();

    var sessions = Api.sessionsModel.where((item) {
      if (item.scheduled != null) {
        var difference = item.scheduled.difference(DateTime.now()).inDays;
        if (difference >= 0 && difference <= 7) {
          return true;
        }
      }
      return false;
    }).toList();

    sessions
        .map((item) {
          return DateTime(
              item.scheduled.year, item.scheduled.month, item.scheduled.day);
        })
        .toSet()
        .forEach((day) {
          _events.putIfAbsent(
              day,
              () => sessions
                  .where((element) =>
                      element.scheduled.difference(day).inDays == 0)
                  .map((e) => e.title)
                  .toList());
        });
  }

  @override
  void dispose() {
    this._calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WelcomeApp.appBar,
      drawer: WelcomeApp.drawer,
      body: Orientation.portrait == MediaQuery.of(context).orientation
          ? _portrait(context)
          : _landscape(context),
      floatingActionButton: Api.sessionsNotifications.length > 0
          ? FloatingActionButton(
              tooltip: 'Notifications',
              child: const Icon(Icons.notifications),
              onPressed: () => _openNotifications(context),
            )
          : null,
      floatingActionButtonLocation:
          Orientation.portrait == MediaQuery.of(context).orientation
              ? FloatingActionButtonLocation.endFloat
              : FloatingActionButtonLocation.centerFloat,
    );
  }
}
