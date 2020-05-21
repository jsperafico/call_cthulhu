import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/widgets/session/session_card.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class SessionsWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final usersController = TextEditingController();
  final descriptionController = TextEditingController();
  final datetimeController = TextEditingController();

  final AppBar _appBar = AppBar(
    title: Text(
      'Sessions',
    ),
  );

  void _openModalNewSession(BuildContext context) {
    showModalBottomSheet(context: context, builder: (ctx) {
      return Card(
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
                  print(
                      '${titleController.text} - ${descriptionController.text} - ${datetimeController.text}');
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: ListView.builder(
        itemBuilder: (context, index) {
          var element = Api.sessionsModel[index];
          return SessionCard(element);
        },
        itemCount: Api.sessionsModel.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openModalNewSession(context),
        tooltip: 'Add Session',
        child: const Icon(Icons.add),
      ),
    );
  }
}
