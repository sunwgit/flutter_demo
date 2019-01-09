import 'package:flutter/material.dart';

class OrientationList extends StatelessWidget {
  OrientationList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: OrientationBuilder(//相对于父容器的空间大小
      //   builder: (context, orientation) {
      //     return GridView.count(
      //       crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      //       children: List.generate(100, (index) {
      //         return Center(
      //           child: Text(
      //             'item$index',
      //             style: Theme.of(context).textTheme.headline,
      //           ),
      //         );
      //       }),
      //     );
      //   },
      // ),
      body: GridView.count(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? 3
                : 4, //相对于screen大小
        children: List.generate(
          50,
          (index) => Container(
                child: Center(
                  child: Text(
                    'item$index',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
                    right: BorderSide(color: Theme.of(context).dividerColor),
                    top: index < 3
                        ? BorderSide(color: Theme.of(context).dividerColor)
                        : BorderSide.none,
                  ),
                ),
                // margin: const EdgeInsets.all(.5),
              ),
        ),
      ),
    );
  }
}
