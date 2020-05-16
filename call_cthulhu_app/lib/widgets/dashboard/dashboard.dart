import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/models/session/investigator_model.dart';
import 'package:call_cthulhu_app/models/session/user_model.dart';
import 'package:call_cthulhu_app/widgets/components/calendar/calendar.dart';
import 'package:call_cthulhu_app/widgets/components/carousel/carousel.dart';
import 'package:call_cthulhu_app/widgets/session/live_card.dart';
import 'package:call_cthulhu_app/widgets/session/session_card.dart';
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
      children: <Widget>[
        Container(
          width: double.infinity,
          child: LiveCard(),
        ),
        Carousel(
          items: Api.sessionsNotifications.map((element) {
            var ownerName = element.owner is UserModel? (element.owner as UserModel).name : (element.owner as InvestigatorModel).name;
            var targetName = element.target is UserModel? (element.target as UserModel).name : (element.target as InvestigatorModel).name;
            return SessionCard(
              texts: [
                'Session: ${element.session.title}',
                'From: $ownerName',
                'To: $targetName',
                'Message: ${element.message}',
                element.dateTime
              ],
            );
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
            return SessionCard(
              texts: [
                element.session.title,
                element.owner is UserModel? (context.owner as UserModel).name : (context.owner as InvestigatorModel).name,
                element.target is UserModel? (context.owner as UserModel).name : (context.owner as InvestigatorModel).name,
                element.message,
                element.dateTime
              ],
            );
          }).toList(),
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
    return Scaffold(
      appBar: WelcomeApp.appBar,
      drawer: WelcomeApp.drawer,
      body: Orientation.portrait == MediaQuery.of(context).orientation
          ? _portrait(context)
          : _landscape(context),
    );
  }
}
