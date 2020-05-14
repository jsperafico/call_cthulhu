import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  final String url;
  final String label;

  UrlButton({this.label, this.url});

  _launchURL() {
    // if (await canLaunch(this.url)) {
    //   await launch(this.url);
    // } else {
      throw 'Could not launch $url';
    // }
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.label),
      onPressed: _launchURL,
    );
  }
}