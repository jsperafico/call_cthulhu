import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/widgets/components/circle_avatar/circle_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionCard extends StatelessWidget {
  final SessionModel session;

  SessionCard(this.session);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleText(CircleSize.BIG, session.keeper.name),
        title: Text(
          session.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(session.description),
                ),
                Text(DateFormat('dd/MM/yyyy H:m').format(DateTime.now()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: session.investigators.map((value) {
                return CircleText(
                  CircleSize.SMALL,
                  value.name,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
