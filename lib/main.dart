import 'package:flutter/material.dart';
import './pages/myHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // brightness: Brightness.dark, //默认light
        accentColor: Colors.cyan[600],
        // fontFamily: 'Courier New',
        // textTheme: TextTheme(
        //   headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   body1: TextStyle(fontSize: 14.0, fontFamily: 'Courier New'),
        // ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
