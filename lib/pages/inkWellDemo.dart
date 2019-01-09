import 'package:flutter/material.dart';

class InkWellDemo extends StatefulWidget {
  InkWellDemo({Key key, this.title}) : super(key: key);
  final String title;
  _InkWellDemoState createState() => _InkWellDemoState();
}

class _InkWellDemoState extends State<InkWellDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 50,
          child: InkWell(
            onTap: () {
              //使用Scaffold.of(context)时报错：
              // Scaffold.of() called with a context that does not contain a Scaffold.
              // 原因：
              // 1.context是最近的class的实例的状态
              // 2.Scaffold.of(context)的最近实例必须是由Scaffold包裹的某个Widget
              // 解决方式：
              // 1. Builder 构建里层 context
              // 2. 另写一个class,在这个class中使用Scaffold.of(context)
              // 3. 在当前Scaffold所在类中声明变量 final _scaffoldKey = GlobalKey<ScaffoldState>();
              //    调用：_scaffoldKey.currentState...
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('This is onTap'),
              //     backgroundColor: Colors.deepPurple,
              //   ),
              // );
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('This is onTap'),
                  backgroundColor: Colors.deepPurple,
                ),
              );
            },
            child: Center(
              child: Container(
                // width: 100,
                // height: 50,
                // color: Colors.deepPurple,
                child: Center(
                  child:
                      Text('MyButton', style: TextStyle(color: Colors.white)),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.deepPurple),
              ),
            ),
          ),
        ),
      ),
      // body: MyButton(),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('This is onTap'),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 100,
            height: 50,
            // color: Colors.deepPurple,
            child: Center(
              child: Text('MyButton', style: TextStyle(color: Colors.white)),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
