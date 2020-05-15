import 'package:call_cthulhu_app/dashboard.dart';
import 'package:call_cthulhu_app/enum/menu.dart';
import 'package:call_cthulhu_app/login.dart';
import 'package:call_cthulhu_app/menu.dart';
import 'package:call_cthulhu_app/session/session_card.dart';
import 'package:call_cthulhu_app/session/sessions.dart';
import 'package:flutter/material.dart';
import 'package:call_cthulhu_app/about.dart';

void main() => runApp(CallOfCthulhuApp());

class CallOfCthulhuApp extends StatefulWidget {
  static var sessionsCards = [
    SessionCard(
      texts: [
        'Super Session Room',
        'Keeper demands your attention on...',
        'Pick Date and time for next session...',
        DateTime.now()
      ],
    ),
    SessionCard(
      texts: [
        'Amazing Session Room',
        'Investigator\'s demands your attention on...',
        'You got an item, please check your inventory...',
        DateTime.now().subtract(Duration(days: 2))
      ],
    ),
    SessionCard(
      texts: [
        'Lazy Session Room',
        'Keeper\'s demands your attention on...',
        'Your Investigator has no Backstory.',
        DateTime.now().subtract(Duration(days: 31))
      ],
    ),
  ];
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
        return SessionsWidget(
          CallOfCthulhuApp.sessionsCards,
        );
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

  Widget _showFloatingActionButton() {
    switch (_selectedMenu) {
      case MenuEnum.PROFILE:
      case MenuEnum.SESSIONS:
        return SessionsWidget.getActionButton();
      case MenuEnum.INVESTIGATORS:
      case MenuEnum.SETTINGS:
      case MenuEnum.ABOUT:
      case MenuEnum.DASHBOARD:
      default:
        return null;
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
            floatingActionButton: _showFloatingActionButton(),
          ),
        ));
  }
}
