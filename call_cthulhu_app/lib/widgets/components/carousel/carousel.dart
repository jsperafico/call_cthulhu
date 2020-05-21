import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Widget> items;

  Carousel({this.items});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Wrap(
            children: items,
          )
        : Flexible(
            flex: 1,
            child: Column(
              children: items.sublist(0,2),
            ),
          );
  }
}
