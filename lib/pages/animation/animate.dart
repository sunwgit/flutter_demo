import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  AnimatedBox({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: AnimatedOpacity(
          opacity: _show ? 1.0 : 0.0,
          duration: Duration(milliseconds: 600),
          child: Container(
              width: 200,
              height: 200,
              color: Colors.deepPurple,
              constraints: BoxConstraints(
                maxHeight: 300,
                minWidth: 300,
              ),
              child: Center(
                child: Text('AnimatedOpacity Demo',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _show = !_show;
          });
        },
        tooltip: 'toggle Opacity',
        child: Icon(Icons.flip),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
