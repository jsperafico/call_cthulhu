import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<AboutWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Cthulhu Icon'),
        Text('Please use the following channels to comunicate with us and know more about this project:'),
        Text('Github Wiki'),
        Text('Github Issues'),
        Text('Github Projects'),
        Text('Thank you for using this application.'),
        Text('Add copyright things and licensing.'),
      ],
    );
  }
}