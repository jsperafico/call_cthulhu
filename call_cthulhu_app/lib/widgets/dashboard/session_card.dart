import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/widgets/components/circle_avatar/circle_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionCard extends StatelessWidget {
  final SessionModel session;

  SessionCard(this.session);

  Widget _subtitle(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            DateFormat('dd/MM/yyyy H:m').format(session.scheduled),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleText(CircleSize.BIG, session.keeper.name),
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            session.title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        subtitle: this._subtitle(context),
      ),
    );
  }
}
