import 'package:call_cthulhu_app/widgets/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(CallOfCthulhuApp());

class CallOfCthulhuApp extends StatelessWidget {
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
          drawer: null,
          body: LoginWidget(),
        ),
      ),
    );
  }
}
