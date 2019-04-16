import 'package:flutter/material.dart';

class DismissDemo extends StatefulWidget {
  DismissDemo({Key key, this.title});
  final String title;
  _DismissDemoState createState() => _DismissDemoState();
}

class _DismissDemoState extends State<DismissDemo> {
  final items = List<String>.generate(10, (index) => 'item$index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            child: ListTile(
              title: Text(item),
            ),
            onDismissed: (direction) {
              print(
                  direction); //DismissDirection.startToEnd DismissDirection.endToStart
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('$item dismissed!'),
              ));
            },
            background: Container(
              color: Colors.deepPurple,
            ),
            secondaryBackground: Container(
              color: Colors.deepOrange,
            ),
          );
        },
      ),
    );
  }
}
