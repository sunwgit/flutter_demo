import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  SnackBarDemo({Key key, this.title}) : super(key: key);
  final String title;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      // body: Builder(
      //   builder: (context) => Center(
      //         child: RaisedButton(
      //           onPressed: () {
      //             final snackBar = SnackBar(
      //               content: Text('hello,this is a snackbar-message!'),
      //               action: SnackBarAction(
      //                 label: 'Message',
      //                 onPressed: () {},
      //               ),
      //             );
      //             Scaffold.of(context).showSnackBar(snackBar);
      //           },
      //           child: Text('show snackbar'),
      //         ),
      //       ),
      // ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            final snackBar = SnackBar(
              duration: Duration(milliseconds: 2000),
              content: Text('hello,this is a snackbar-message!'),
              action: SnackBarAction(
                label: 'Message',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
            // Scaffold.of(context).showSnackBar(snackBar);//错误：这里的Scaffold.of(context)不能获取到ScaffoldState
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
          child: Text('show snackbar'),
        ),
      ),
    );
  }
}
