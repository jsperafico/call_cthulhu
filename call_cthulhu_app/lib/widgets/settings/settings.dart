import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  var _appBar = AppBar(
    title: Text(
      'Settings',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Share your Video:'),
                        RaisedButton(
                          child: Text('Enable/Disable'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Select your camera:'),
                        RaisedButton(
                          child: Text('Front/Back'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Preview:'),
                        Text('Preview video'),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Share your audio:'),
                        RaisedButton(
                          child: Text('Enable/Disable'),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Access you device data:'),
                        RaisedButton(
                          child: Text('Enable/Disable'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('List of accessable folders:'),
                        Text('Image'),
                        Text('Local folder from Cthulhu App'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
