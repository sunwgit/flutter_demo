import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  TabDemo({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                'car',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Center(
              child: Text('bike',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            Center(
              child: Text('boat',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
