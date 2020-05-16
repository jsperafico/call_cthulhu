import 'package:call_cthulhu_app/widgets/components/button/url_button.dart';
import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          Column(
            children: <Widget>[
              UrlButton(
                label: 'Login Using Facebook',
                url: 'facebok url',
              ),
              UrlButton(
                label: 'Login Using Google',
                url: 'google url',
              ),
              UrlButton(
                label: 'Login Using Instagram',
                url: 'facebok url',
              ),
              RaisedButton(
                child: Text('Login as Guest'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => WelcomeApp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
