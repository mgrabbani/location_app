import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location_app/homepage.dart';
import 'package:location_app/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations',
      home: Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _name = (prefs.getString('name') ?? "");
    print("Runner name read from file: $_name");

    if (_name != "") {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => const HomePage(title: 'Bengal Tigers - Locations')));
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => RunnerNameInput()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

