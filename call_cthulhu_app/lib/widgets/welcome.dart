import 'package:call_cthulhu_app/widgets/dashboard/dashboard.dart';
import 'package:call_cthulhu_app/widgets/menu.dart';
import 'package:flutter/material.dart';

class WelcomeApp extends StatefulWidget {
  static var drawer = MenuWidget();
  static var appBar = AppBar(
    title: Text(
      'Call of Cthulhu RPG',
    ),
  );

  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<WelcomeApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: DashboardWidget(),
      ),
    );
  }
}
