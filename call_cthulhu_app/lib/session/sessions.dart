import 'package:call_cthulhu_app/session/session_card.dart';
import 'package:flutter/material.dart';

class SessionsWidget extends StatelessWidget {
  static FloatingActionButton getActionButton() {
    return FloatingActionButton(
      onPressed: null,
      tooltip: 'Increment Counter',
      child: const Icon(Icons.add),
    );
  }

  List<SessionCard> _sessions;

  SessionsWidget(List<SessionCard> sessions) {
    this._sessions = sessions.map((e) {
      e.texts.removeAt(1);
      e.texts.insert(1, 'Users: Joao, Paulo, Marcieli');
      e.texts.add('View');
      e.texts.add('Leave');
      return e;
    }).toList();
  }

  final titleController = TextEditingController();
  final usersController = TextEditingController();
  final descriptionController = TextEditingController();
  final datetimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: this.titleController,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Users',
                  ),
                  controller: this.usersController,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  controller: this.descriptionController,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Datetime',
                  ),
                  controller: this.datetimeController,
                ),
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    print('${titleController.text} - ${descriptionController.text} - ${datetimeController.text}');
                  },
                ),
              ],
            ),
          ),
        ),
        Column(
          children: this._sessions,
        ),
        // ListView(
        //   scrollDirection: Axis.vertical,
        //   children: this._sessions,
        // )
      ],
    );
  }
}
