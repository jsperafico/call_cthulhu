import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/widgets/components/calendar/calendar.dart';
import 'package:call_cthulhu_app/widgets/dashboard/live_card.dart';
import 'package:call_cthulhu_app/widgets/dashboard/session_card.dart';
import 'package:call_cthulhu_app/widgets/dashboard/session_notification.dart';
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
  SessionModel _liveSession;

  List<Widget> _portrait(BuildContext context) {
    return [
      Container(
        width: double.infinity,
        child: LiveCard(Api.sessionsModel.firstWhere(
            (item) => item.scheduled.difference(DateTime.now()).inDays == 0)),
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
    ];
  }

  List<Widget> _landscape(BuildContext context) {
    return [
      Flexible(
        flex: 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: LiveCard(this._liveSession),
              ),
              Calendar(
                this._calendarController,
                this._events,
                this._onDaySelected,
              ),
            ],
          ),
        ),
      ),
      this._createListSessionCard(context),
    ];
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
        : Expanded(
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

    this._liveSession = Api.sessionsModel.firstWhere(
        (item) => item.scheduled.difference(DateTime.now()).inDays == 0,
        orElse: null);

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
      body: Flex(
        direction: Orientation.portrait == MediaQuery.of(context).orientation
            ? Axis.vertical
            : Axis.horizontal,
        mainAxisAlignment:
            Orientation.portrait == MediaQuery.of(context).orientation
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: Orientation.portrait == MediaQuery.of(context).orientation
            ? _portrait(context)
            : _landscape(context),
      ),
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
