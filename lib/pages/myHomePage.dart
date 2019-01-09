import 'package:flutter/material.dart';
import '../pages/counter.dart';
import '../pages/animate.dart';
import '../pages/drawerDemo.dart';
import '../pages/snackbarDemo.dart';
import '../pages/orientationList.dart';
import '../pages/tabDemo.dart';
import '../pages/formDemo.dart';
import '../pages/focusNodeDemo.dart';
import '../pages/textFieldChange.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          _buildListView(Counter(title: '计数器'), '计数器'),
          _buildListView(AnimatedBox(title: '动画'), '动画'),
          _buildListView(SnackBarDemo(title: 'SnackBar'), 'SnackBar'),
          _buildListView(OrientationList(title: 'OrientationList'), 'OrientationList'),
          _buildListView(TabDemo(title: 'TabDemo'), 'TabDemo'),
          _buildListView(FormDemo(title: 'FormDemo'), 'FormDemo'),
          _buildListView(MyCustomForm(title: 'TextField Focus'), 'TextField Focus'),
          _buildListView(TextFieldChange(title: 'TextFieldChange'), 'TextFieldChange'),
        ],
      ),
      drawer: DrawerDemo(),
    );
  }

  Widget _buildListView(Widget widget, String routeName) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
      },
      child: Text(routeName),
      color: Colors.deepPurple,
      textColor: Colors.redAccent,
    );
  }
}
