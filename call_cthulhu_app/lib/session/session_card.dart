import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  final List<String> texts;

  SessionCard({this.texts});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: texts.map((element) { return Text(element); }).toList(),
      ),
    );
  }
}
