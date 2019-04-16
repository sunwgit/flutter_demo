import 'package:flutter/material.dart';
import 'tabs/first.dart';

class BottomNavBar extends StatefulWidget {
  final String title;
  BottomNavBar(this.title);
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    //Initialize the Tab Controller
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          FirstTab(),
          FirstTab(),
          FirstTab(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
          ],
          controller: _controller,
        ),
      ),
    );
  }
}
