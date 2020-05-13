import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  Widget _portrait(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: Card(
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
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: true,
              reverse: false,
              scrollDirection: Axis.horizontal,
            ),
            items: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Super Session Room'),
                      Text('Keeper demands your attention on...'),
                      Text('Pick Date and time for next session...'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Amazing Session Room'),
                      Text('Investigator\'s demands your attention on...'),
                      Text('You got an item, please check your inventory...'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Lazy Session Room'),
                      Text('Keeper\'s demands your attention on...'),
                      Text('Your Investigator has no Backstory.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Text('Calendar with upcoming sessions.'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _landscape(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: false,
                enableInfiniteScroll: true,
                reverse: false,
                scrollDirection: Axis.vertical),
            items: <Widget>[
              Container(
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Super Session Room'),
                      Text('Keeper demands your attention on...'),
                      Text('Pick Date and time for next session...'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Amazing Session Room'),
                      Text('Investigator\'s demands your attention on...'),
                      Text('You got an item, please check your inventory...'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Lazy Session Room'),
                      Text('Keeper\'s demands your attention on...'),
                      Text('Your Investigator has no Backstory.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text('Live Section.'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  elevation: 5,
                  child: Text('Calendar with upcoming sessions.'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? _portrait(context)
        : _landscape(context);
  }
}
