import 'package:call_cthulhu_app/calendar/calendar.dart';
import 'package:call_cthulhu_app/carousel/carousel.dart';
import 'package:call_cthulhu_app/session/live_card.dart';
import 'package:call_cthulhu_app/session/session_card.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  var sessionsCards = [
    SessionCard(
      texts: [
        'Super Session Room',
        'Keeper demands your attention on...',
        'Pick Date and time for next session...'
      ],
    ),
    SessionCard(
      texts: [
        'Amazing Session Room',
        'Investigator\'s demands your attention on...',
        'You got an item, please check your inventory...'
      ],
    ),
    SessionCard(
      texts: [
        'Lazy Session Room',
        'Keeper\'s demands your attention on...',
        'Your Investigator has no Backstory.'
      ],
    ),
  ];

  Widget _portrait(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: LiveCard(),
        ),
        Carousel(
          items: sessionsCards,
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
          items: sessionsCards,
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
