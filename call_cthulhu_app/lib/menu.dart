import 'package:call_cthulhu_app/enum/menu.dart';
import 'package:call_cthulhu_app/main.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }

}

class _MenuState extends State<MenuWidget> {

  void itemSelected(MenuEnum value) {
    CallOfCthulhuApp.changeMenu(value);
    Navigator.pop(this.context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => itemSelected(MenuEnum.DASHBOARD),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Profile'),
            onTap: () => itemSelected(MenuEnum.PROFILE),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Sessions'),
            onTap: () => itemSelected(MenuEnum.SESSIONS),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Investigators'),
            onTap: () => itemSelected(MenuEnum.INVESTIGATORS),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => itemSelected(MenuEnum.SETTINGS),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => itemSelected(MenuEnum.ABOUT),
          ),
        ],
      ),
    );
  }
}