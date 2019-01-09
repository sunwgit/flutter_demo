import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  HorizontalList({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(3, (index) => 'item$index');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        height: 160,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(right: 10, left: 10),
                // color: Color.lerp(Colors.orange, Colors.purple, .5),
                decoration: BoxDecoration(
                  color: Color.lerp(Colors.orange, Colors.purple, .5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text('item$i'),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
