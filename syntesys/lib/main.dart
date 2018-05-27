// Copyright (c) 2018, Void P34r 
// Source Code

// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/auth/personal_data.dart';
import 'screens/auth/signin.dart';
import 'screens/main/activity.dart';
import 'screens/welcome.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(new SynApp());
}

class SynApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Welcome(),
      routes:  <String, WidgetBuilder> {
        "/welcome":(BuildContext context) => new Welcome(),
        "/signin": (BuildContext context) => new SignIn(),
        "/personal_data": (BuildContext context) => new PersonalData(),
        "/activities": (BuildContext context) => new Activities(),
      },
    );
  }
}