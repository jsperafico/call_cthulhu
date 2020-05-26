import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/widgets/components/circle_avatar/circle_text.dart';
import 'package:flutter/material.dart';

class LiveCard extends StatelessWidget {
  SessionModel currentSession;

  LiveCard(this.currentSession);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          this.currentSession == null
              ? Text('No sessions scheduled for today.')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Live \'${this.currentSession.title}\' Session',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Icon(
                      Icons.camera_enhance,
                      color: Colors.red,
                    )
                  ],
                ),
          Text(
            'Online Friends',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: currentSession.investigators
                .map((value) {
                  return CircleText(
                    CircleSize.SMALL,
                    value.name,
                  );
                })
                .toList()
                .sublist(0, 2),
          ),
        ]),
      ),
    );
  }
}
