import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  var _appBar = AppBar(
    title: Text(
      'Your Profile',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Text('Profile Name'),
                Text('Your connected to this app through \'Google account\''),
                RaisedButton(
                  child: Text('Disconnect'),
                  onPressed: null,
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text('You can download your app data through button bellow.'),
                RaisedButton(
                  child: Text('Download here'),
                  onPressed: null,
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text('You can delete your account any time you want.'),
                Text('We warn you that this action isn\'t reversible.'),
                RaisedButton(
                  child: Text('Delete me from your database'),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
