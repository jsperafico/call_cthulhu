import 'package:call_cthulhu_app/widgets/welcome.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  var _appBar = AppBar(
    title: Text(
      'Your Profile',
    ),
  );

  Widget _disconnectCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'You are connected through an \'Google account\'',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          child: Text(
            'Disconnect',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Widget _downloadCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Download your user stored data',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          child: Text(
            'Download',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Widget _deleteCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Delete your data from our database',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Text(
                'This is not reversible!',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        RaisedButton(
          child: Text(
            'Delete me',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: WelcomeApp.drawer,
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              elevation: 5,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: this._disconnectCard(context)),
            ),
          ),
          Flexible(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              elevation: 5,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: this._downloadCard(context)),
            ),
          ),
          Flexible(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              elevation: 5,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: this._deleteCard(context)),
            ),
          ),
        ],
      ),
    );
  }
}
