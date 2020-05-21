import 'package:flutter/material.dart';

class CircleText extends StatelessWidget {

  final CircleSize size;
  final String value;

  CircleText(this.size, this.value);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: this.size == CircleSize.BIG ? 30 : 15,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FittedBox(
            child: Text(value),
          ),
        ),
      );
  }
}

enum CircleSize {
  BIG,
  SMALL
}