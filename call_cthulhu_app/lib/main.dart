import 'package:call_cthulhu_app/dashboard.dart';
import 'package:call_cthulhu_app/enum/menu.dart';
import 'package:call_cthulhu_app/login.dart';
import 'package:call_cthulhu_app/menu.dart';
import 'package:flutter/material.dart';
import 'package:call_cthulhu_app/about.dart';

void main() => runApp(CallOfCthulhuApp());

class CallOfCthulhuApp extends StatefulWidget {
  static var _appState = MainState();

  static changeMenu(MenuEnum value) {
    _appState._changeMenu(value);
  }

  static login() {
    _appState._login();
  }

  @override
  State<StatefulWidget> createState() {
    return CallOfCthulhuApp._appState;
  }
}

class MainState extends State<CallOfCthulhuApp> {
  MenuEnum _selectedMenu = MenuEnum.DASHBOARD;
  bool _logedAsGuest = false;

  void _changeMenu(MenuEnum value) {
    setState(() {
      _selectedMenu = value;
    });
  }

  void _login() {
    setState(() {
      _logedAsGuest = true;
      _selectedMenu = MenuEnum.DASHBOARD;
    });
  }

  Widget _getCorrectBodyConsideringMenu() {
    switch (_selectedMenu) {
      case MenuEnum.PROFILE:
      case MenuEnum.SESSIONS:
      case MenuEnum.INVESTIGATORS:
      case MenuEnum.SETTINGS:
      case MenuEnum.ABOUT:
        return AboutWidget();
        break;
      case MenuEnum.DASHBOARD:
      default:
        return DashboardWidget();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Call of Cthulhu RPG',
              ),
            ),
            drawer: _logedAsGuest ? MenuWidget() : null,
            body: _logedAsGuest ? _getCorrectBodyConsideringMenu() : LoginWidget(),
          ),
        ));
  }
}
