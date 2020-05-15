import 'package:call_cthulhu_app/calendar/calendar.dart';
import 'package:call_cthulhu_app/carousel/carousel.dart';
import 'package:call_cthulhu_app/main.dart';
import 'package:call_cthulhu_app/session/live_card.dart';
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
      children: <Widget>[
        Container(
          width: double.infinity,
          child: LiveCard(),
        ),
        Carousel(
          items: CallOfCthulhuApp.sessionsCards.sublist(0, 3),
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
          items: CallOfCthulhuApp.sessionsCards,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LiveCard(),
            Calendar(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? _portrait(context)
        : _landscape(context);
  }
}
