import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
        Text('If you want to know how can you contribute with this project or wanna report some issue, please do it:'),
        Text('Github Wiki'),
        Text('Github Issues'),
        Text('Github Projects'),
        Text('Thank you for using this application.'),
        Text('Add copyright things and licensing.'),
      ],
    );
  }
}
