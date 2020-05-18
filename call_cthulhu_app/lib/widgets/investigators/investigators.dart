import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/widgets/session/session_card.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class InvestigatorsWidget extends StatelessWidget {
  final nameController = TextEditingController();
  final userController = TextEditingController();

  var _listInvestigatorsMarcieli;

  InvestigatorsWidget() {
    _listInvestigatorsMarcieli = Api.investigatorsModel
        .where((element) => element.user.name == 'Marcieli')
        .toList();
  }

  void _openModalNewInvestigator(BuildContext conext) {
    showModalBottomSheet(context: conext, builder: (_) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investigators',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => _openModalNewInvestigator(context),
          ),
        ],
      ),
      drawer: WelcomeApp.drawer,
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SessionCard(
                  texts: [_listInvestigatorsMarcieli[index].name],
                );
              },
              itemCount: _listInvestigatorsMarcieli.length,
            ),
            flex: 1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openModalNewInvestigator(context),
        tooltip: 'Add Investigator',
        child: const Icon(Icons.add),
      ),
    );
  }
}
