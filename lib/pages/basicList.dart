import 'package:flutter/material.dart';

class BasicList extends StatelessWidget {
  BasicList({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('item1'), leading: Icon(Icons.mail)),
          ListTile(title: Text('item2'), leading: Icon(Icons.phone)),
          ListTile(title: Text('item3'), leading: Icon(Icons.map)),
        ],
      ),
    );
  }
}
