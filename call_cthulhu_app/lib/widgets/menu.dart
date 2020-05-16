import 'package:call_cthulhu_app/enum/menu.dart';
import 'package:call_cthulhu_app/widgets/about/about.dart';
import 'package:call_cthulhu_app/widgets/dashboard/dashboard.dart';
import 'package:call_cthulhu_app/widgets/investigators/investigators.dart';
import 'package:call_cthulhu_app/widgets/profile/profile.dart';
import 'package:call_cthulhu_app/widgets/session/sessions.dart';
import 'package:call_cthulhu_app/widgets/settings/settings.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  _itemSelected(BuildContext context, MenuEnum value) {
    // Navigator.popUntil(context, (route) => route.isFirst);

    Widget toOpen;

    switch (value) {
      case MenuEnum.PROFILE:
        toOpen = ProfileWidget();
        break;
      case MenuEnum.SESSIONS:
        toOpen = SessionsWidget();
        break;
      case MenuEnum.INVESTIGATORS:
        toOpen = InvestigatorsWidget();
        break;
      case MenuEnum.SETTINGS:
        toOpen = SettingsWidget();
        break;
      case MenuEnum.ABOUT:
        toOpen = AboutWidget();
        break;
      case MenuEnum.DASHBOARD:
      default:
        toOpen = DashboardWidget();
        break;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => toOpen,
      ),
    );
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
            onTap: () => _itemSelected(context, MenuEnum.DASHBOARD),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Profile'),
            onTap: () => _itemSelected(context, MenuEnum.PROFILE),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Sessions'),
            onTap: () => _itemSelected(context, MenuEnum.SESSIONS),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Investigators'),
            onTap: () => _itemSelected(context, MenuEnum.INVESTIGATORS),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => _itemSelected(context, MenuEnum.SETTINGS),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => _itemSelected(context, MenuEnum.ABOUT),
          ),
        ],
      ),
    );
  }
}