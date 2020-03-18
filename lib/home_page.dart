import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<double> _controller = StreamController<double>.broadcast();
  StreamSubscription <double> streamSubscription ;
  double x= 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(splashColor: Colors.yellow[800],
              child: Text("Subscribe"),
              color: Colors.yellowAccent,
              onPressed: () {
             streamSubscription= getDelayedRandomValue().listen((event) {
                print("Value Is : $event");
              });
              },
            ),
            MaterialButton(splashColor: Colors.lightBlue[800],
              child: Text("Send Value"),
              color: Colors.lightBlueAccent,
              onPressed: () {
                _controller.add(x++);
              },
            ),
            MaterialButton(splashColor: Colors.red[800],
              child: Text("Unsubscribtion"),
              color: Colors.red,
              onPressed: () {
              streamSubscription?.cancel();
              },
            ),

          ],
        ),
      ),
    );
  }

  Stream<double> getDelayedRandomValue() async* {
    var randomValue = Random();
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield x+(randomValue.nextDouble());
    }
  }
}
