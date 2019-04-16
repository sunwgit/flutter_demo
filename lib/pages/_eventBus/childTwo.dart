import 'package:flutter/material.dart';
import 'eventBus.dart';

class ChildTwo extends StatefulWidget {
  final String title;
  ChildTwo({this.title});
  _ChildTwoState createState() => _ChildTwoState();
}

class _ChildTwoState extends State<ChildTwo> {
  String dataFromSibling;
  @override
  void initState() {
    super.initState();
    eventBus.on<MyEventBus>().listen((MyEventBus data) => _show(data.text));
  }

  void _show(String val) {
    setState(() {
      dataFromSibling = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headline,
        ),
        Text('从兄弟组件传过来的值：$dataFromSibling')
      ],
    );
  }
}
