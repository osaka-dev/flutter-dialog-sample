import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'dialog',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Choices { YES, NO, MAYBE }

class _MyAppState extends State<MyApp> {
  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _askUserWithShowDialog() async {
    switch (await showDialog(
        context: context,
        child: SimpleDialog(
          title: new Text("Take the choice"),
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.YES);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.NO);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.MAYBE);
                    },
                    child: Text(
                      "Maybe",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                ],
              ),
            ),
          ],
        ))) {
      case Choices.YES:
        _setValue('Yes');
        break;
      case Choices.NO:
        _setValue("No");
        break;
      case Choices.MAYBE:
        _setValue("Maybe");
        break;
    }
  }

  Future _askUserWithShowGeneralDialog() async {
    switch (await showGeneralDialog<Choices>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: Duration.zero,
        barrierColor: Colors.black.withAlpha(100),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 300,
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TextStyleがMaterialAppの初期値のままになる
                  /// 他のウィジェットはmaterialパッケージなのでよしなにスタイル適用してくれている
                  Text(
                    'showGeneralDialog',
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.YES);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.NO);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Choices.MAYBE);
                    },
                    child: Text(
                      "Maybe",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                ],
              ),
            ),
          );
        })) {
      case Choices.YES:
        _setValue('Yes');
        break;
      case Choices.NO:
        _setValue("No");
        break;
      case Choices.MAYBE:
        _setValue("Maybe");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Sample'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              RaisedButton(
                onPressed: () => _askUserWithShowGeneralDialog(),
                child: Text("showGeneralDialog"),
              ),
              RaisedButton(
                onPressed: () => _askUserWithShowDialog(),
                child: Text("showDialog"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
