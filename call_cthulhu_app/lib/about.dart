import 'package:call_cthulhu_app/button/url_button.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
        Text(
            'If you want to know how can you contribute with this project or wanna report some issue, please do it:'),
        Column(
          children: <Widget>[
            UrlButton(
              label: 'Github Wiki',
              url: 'https://github.com/jsperafico/call_cthulhu/wiki',
            ),
            UrlButton(
              label: 'Github Issues',
              url: 'https://github.com/jsperafico/call_cthulhu/issues',
            ),
            UrlButton(
              label: 'Github Projects',
              url: 'https://github.com/jsperafico/call_cthulhu/projects',
            ),
          ],
        ),
        Text('Thank you for using this application.'),
        Text('Add copyright things and licensing.'),
      ],
    );
  }
}
