import 'package:flutter/material.dart';

class RetrieveTextFieldValue extends StatefulWidget {
  RetrieveTextFieldValue({Key key, this.title}) : super(key: key);
  final String title;
  _RetrieveTextFieldValueState createState() => _RetrieveTextFieldValueState();
}

class _RetrieveTextFieldValueState extends State<RetrieveTextFieldValue> {
  final myController = TextEditingController();
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
              controller: myController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              if (myController.text.isEmpty) {
                return AlertDialog(
                  content: Text('输入框的值为空'),
                );
              }
              return AlertDialog(
                content: Text('输入框的值为：${myController.text}'),
              );
            }),
        tooltip: '显示输入框内容',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
