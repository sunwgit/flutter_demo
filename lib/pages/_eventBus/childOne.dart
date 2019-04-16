import 'package:flutter/material.dart';
import 'eventBus.dart';

class ChildOne extends StatefulWidget {
  ChildOne({this.title, this.dataFromParent, this.callback});
  final String dataFromParent;
  final callback;
  final String title;
  _ChildOneState createState() => _ChildOneState();
}

class _ChildOneState extends State<ChildOne> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headline,
        ),
        Text('从父组件传过来的值：${widget.dataFromParent}'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: '请输入要传递的值'),
          ),
        ),
        FlatButton(
          onPressed: () {
            widget.callback(_controller.text);
          },
          child: Text('传值给父组件'),
          color: Colors.deepPurple,
          textColor: Colors.white,
        ),
        FlatButton(
          onPressed: () {
            eventBus.fire(MyEventBus(_controller.text));
          },
          child: Text('传值给兄弟组件'),
          color: Colors.deepPurple,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
