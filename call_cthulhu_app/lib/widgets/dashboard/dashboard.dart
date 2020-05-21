import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/widgets/components/calendar/calendar.dart';
import 'package:call_cthulhu_app/widgets/components/carousel/carousel.dart';
import 'package:call_cthulhu_app/widgets/dashboard/session_notifier.dart';
import 'package:call_cthulhu_app/widgets/session/live_card.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  Widget _portrait(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: LiveCard(),
        ),
        Carousel(
          items: Api.sessionsNotifications.map((element) {
            return SessionNotifier(element);
          }).toList(),
        ),
        Container(
          width: double.infinity,
          child: Calendar(),
        ),
      ],
    );
  }

  Widget _landscape(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Carousel(
          items: Api.sessionsNotifications.map((element) {
            return SessionNotifier(element);
          }).toList(),
        ),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LiveCard(),
              Calendar(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WelcomeApp.appBar,
      drawer: WelcomeApp.drawer,
      body: Orientation.portrait == MediaQuery.of(context).orientation
          ? _portrait(context)
          : _landscape(context),
    );
  }
}
