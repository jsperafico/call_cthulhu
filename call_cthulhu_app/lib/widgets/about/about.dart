import 'package:call_cthulhu_app/widgets/components/button/url_button.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<AboutWidget> {
  List<Widget> gitButtons = [
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
  ];

  var _appBar = AppBar(
    title: Text(
      'About',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: Column(
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
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: this.gitButtons,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: this.gitButtons,
                ),
          Text('Thank you for using this application.'),
          Text('Add copyright things and licensing.'),
        ],
      ),
    );
  }
}
