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
        Orientation.portrait == MediaQuery.of(context).orientation
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  DateFormat('dd/MM/yyyy H:m').format(session.scheduled),
                  textAlign: TextAlign.center,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      DateFormat('dd/MM/yyyy \n H:m').format(session.scheduled),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
        SizedBox(height: 10),
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
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {},
        ),
      ),
    );
  }
}
