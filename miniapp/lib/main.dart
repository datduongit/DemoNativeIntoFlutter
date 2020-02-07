import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'miniapp1/views/Home.dart';

void main() => runApp(MyApp(window.defaultRouteName));

class MyApp extends StatelessWidget {

  final String router;

  MyApp(this.router);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'FLUTTER BURGER',
      theme: ThemeData(
        indicatorColor: Colors.white,
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        accentColor: Colors.black,
      ),
      home: switchRouter(),
    );
  }

  Widget switchRouter() {
    switch (router) {
      case "miniapp":
        return Home();
      case "miniapp2":
        return MyHomePage();
    }
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text("Demo"),
      ),
    body: new MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {

  MyHome({Key, key, this.title}) : super(key: key);
  
  final String title;

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {

  static const platformChannel = MethodChannel("dat.duong.miniapp/battery");
  String _responseFromNativeCode = 'Waiting for Response...';

  Future<Void> getValueFromNativeCode() async {
    String response = "";
    try {
      String result = await platformChannel.invokeMethod("getUserName");
      response = result;
      print("response: ${response}");
    } on PlatformException catch (e) {
        print("error '${e.message}'");
    }

    setState(() {
      _responseFromNativeCode = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Call Native Method'),
              onPressed: getValueFromNativeCode,
            ),
            Text(_responseFromNativeCode),
          ],
        ),
      ),
    );
  }
}