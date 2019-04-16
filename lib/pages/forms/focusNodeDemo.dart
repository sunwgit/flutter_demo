import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key, this.title}) : super(key: key);
  final String title;
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'First TextField(This is a hintText)'),
            ),
            TextField(
              focusNode: myFocusNode,
              decoration: InputDecoration(
                  labelText: 'Second Textfield(This is a labelText)'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return FocusScope.of(context).requestFocus(myFocusNode);
        },
        tooltip: 'Focus Second TextField',
        child: Icon(Icons.edit),
      ),
    );
  }
}
