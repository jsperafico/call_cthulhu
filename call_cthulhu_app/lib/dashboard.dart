import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Dashboard information should be here.'),
        Text('Keeper\'s demands your attention on...'),
        Text('Live Section.'),
        Text('Preferable datetime for next session of \'Super Session Room\'.'),
        Text('Preferable datetime for next session of \'Incredible Session Room\'.'),
        Text('Preferable datetime for next session of \'Really? Is that a Session Room?\'.'),
        Text('Calendar with upcoming sessions.'),
      ],
    );
  }
}
