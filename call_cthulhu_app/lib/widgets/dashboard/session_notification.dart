import 'package:call_cthulhu_app/models/investigator_model.dart';
import 'package:call_cthulhu_app/models/session/session_notify_model.dart';
import 'package:call_cthulhu_app/models/user_model.dart';
import 'package:call_cthulhu_app/widgets/components/circle_avatar/circle_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionNotification extends StatelessWidget {
  final SessionNotifyModel session;

  SessionNotification(this.session);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleText(
          CircleSize.SMALL,
          session.owner is UserModel
              ? (session.owner as UserModel).name
              : (session.owner as InvestigatorModel).name,
        ),
        title: Text(
          session.session.title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          children: <Widget>[
            Text(
              session.message,
              textAlign: TextAlign.justify,
            ),
            Text(DateFormat('dd/MM/yyyy H:m').format(session.dateTime)),
          ],
        ),
        trailing: CircleText(
          CircleSize.SMALL,
          session.target is UserModel
              ? (session.target as UserModel).name
              : (session.target as InvestigatorModel).name,
        ),
      ),
    );
  }
}
