import 'package:call_cthulhu_app/menu.dart';
import 'package:flutter/material.dart';
import 'about.dart';

void main() => runApp(CallOfCthulhuApp());

class CallOfCthulhuApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<CallOfCthulhuApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Call of Cthulhu RPG',
          ),
          // bottom: TabWidget.createTabBar(),
        ),
        drawer: MenuWidget(),
        body: AboutWidget(),
      ),
    );
  }
}

//App bar
//Tab content
//About Page
//Showcase Page
