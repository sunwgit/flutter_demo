import 'package:flutter/material.dart';
import '../model/listItem.dart';
class MixedList extends StatelessWidget {
  MixedList({this.title, @required this.items});
  final String title;
  final List<ListItem> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.msg),
            );
          }
        },
      ),
    );
  }
}