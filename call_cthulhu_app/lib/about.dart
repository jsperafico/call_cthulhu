import 'package:call_cthulhu_app/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends State<CallOfCthulhuApp> {
  var questionIndex = 0;
  var buttonPressed = 'None where pressed';

  void callFirst() {
    this.setState(() {
      this.questionIndex++;
      this.buttonPressed = 'first';
    });
  }

  void callSecondAndThrid() {
    this.setState(() {
      this.questionIndex = 0;
      this.buttonPressed = 'second or thrid?';
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s you favorite color?',
      'What\'s you favorite animal',
    ];
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
        ),
        body: Column(
          children: [
            Text(questions[this.questionIndex]),
            RaisedButton(
              child: Text('Answare 1'),
              onPressed: this.callFirst,
            ),
            RaisedButton(
              child: Text('Answare 2'),
              onPressed: this.callSecondAndThrid,
            ),
            RaisedButton(
              child: Text('Answare 3'),
              onPressed: this.callSecondAndThrid,
            ),
            Text(
              '$buttonPressed',
            ),
          ],
        ),
      ),
    );
  }
}
