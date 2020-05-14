import 'package:flutter/material.dart';

class LiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Text('Live Section.'),
          Icon(
            Icons.camera_enhance,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
