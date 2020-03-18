import 'dart:async';
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
  StreamController<double> _controller = StreamController();
  StreamSubscription <double> streamSubscription ;

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
                Stream _stream = _controller.stream;
                streamSubscription=_stream.listen((event) {
                  print("Value Of Controller : $event");
                });
              },
            ),
            MaterialButton(splashColor: Colors.lightBlue[800],
              child: Text("Send Value"),
              color: Colors.lightBlueAccent,
              onPressed: () {
                _controller.add(12.5);
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
}
