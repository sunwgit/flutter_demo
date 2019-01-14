import 'package:flutter/material.dart';

import 'childOne.dart';
import 'childTwo.dart';

class EventBusDemo extends StatefulWidget {
  EventBusDemo(this.title);
  final String title;

  _EventBusDemoState createState() => _EventBusDemoState();
}

class _EventBusDemoState extends State<EventBusDemo> {
  String dataFromChildOne = '';
  String data2ChildOne = 'world';
  void setDataFromChildOne(String val) {
    setState(() {
      dataFromChildOne = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              Text('父组件', style: Theme.of(context).textTheme.headline),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '从子组件ChildOne中传来的值：',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    dataFromChildOne,
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  ),
                ],
              ),
              _buidChild(
                ChildOne(
                  title: 'ChildOne',
                  dataFromParent: data2ChildOne,
                  callback: (val) => this.setDataFromChildOne(val),
                ),
              ),
              _buidChild(ChildTwo(
                title: 'ChildTwo',
              )),
            ],
          ),
        ));
  }

  Widget _buidChild(Widget widget) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: Center(
        child: widget,
      ),
    );
  }
}
