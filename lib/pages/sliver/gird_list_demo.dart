import 'package:flutter/material.dart';
import 'dart:math';

class GridListDemo extends StatefulWidget {
  @override
  _GridListDemoState createState() => _GridListDemoState();
}

class _GridListDemoState extends State<GridListDemo> {
  Color _getRandomColor() {
    return Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SliverList'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        color: _getRandomColor(),
                        height: 150,
                        // width: 150,
                      ),
                  childCount: 4),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Text('分割线-------'),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                )
              ]),
            ),
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              delegate: SliverChildListDelegate([
                Text('分割线-------'),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                ),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                ),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                ),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                ),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                ),
                Container(
                  color: _getRandomColor(),
                  height: 150,
                  // width: 150,
                )
              ]),
            ),
            SliverGrid(
              gridDelegate:
                  // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        color: _getRandomColor(),
                        height: 150,
                        child: Text('SliverChildBuilderDelegate'),
                        // width: 150,
                      ),
                  childCount: 20),
            )
          ],
        ));
  }
}
