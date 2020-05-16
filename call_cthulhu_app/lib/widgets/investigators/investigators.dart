import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/widgets/session/session_card.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class InvestigatorsWidget extends StatelessWidget {
  final nameController = TextEditingController();
  final userController = TextEditingController();

  _form() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              controller: this.nameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'User',
              ),
              controller: this.userController,
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                print('${nameController.text} - ${userController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: Text(
      'Investigators',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _form(),
          Column(
            children: Api.investigatorsModel
                .where((element) => element.user.name == 'Marcieli')
                .map((element) {
              return SessionCard(
                texts: [element.name],
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add Investigator',
        child: const Icon(Icons.add),
      ),
    );
  }
}
