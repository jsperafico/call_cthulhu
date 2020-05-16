import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionCard extends StatelessWidget {
  final List<Object> texts;

  SessionCard({this.texts});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: texts.map((element) {
          if(element is DateTime) {
            return Text(DateFormat('dd/MM/yyyy Hm').format(element));
          }
           return Text(element);
        }).toList(),
      ),
    );
  }
}
