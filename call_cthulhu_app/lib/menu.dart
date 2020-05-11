import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }

}

class _MenuState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Hello User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Sessions'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Characters'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}