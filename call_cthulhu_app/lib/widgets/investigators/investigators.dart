import 'package:call_cthulhu_app/models/api.dart';
import 'package:call_cthulhu_app/models/session/investigator_model.dart';
import 'package:call_cthulhu_app/widgets/components/circle_avatar/circle_text.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class InvestigatorsWidget extends StatelessWidget {
  final nameController = TextEditingController();
  final userController = TextEditingController();

  List<InvestigatorModel> get marcieliInvestigators {
    return Api.investigatorsModel
        .where((element) => element.user.name == 'Marcieli')
        .toList();
  }

  void _openModalNewInvestigator(BuildContext conext) {
    showModalBottomSheet(
        context: conext,
        builder: (_) {
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
                return Card(
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleText(
                        CircleSize.BIG, this.marcieliInvestigators[index].name),
                  ),
                );
              },
              itemCount: this.marcieliInvestigators.length,
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
