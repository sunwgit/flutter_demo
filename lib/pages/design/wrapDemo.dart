import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WrapDemo'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Wrap(
            spacing: 10,
            children: List.generate(
                30,
                (i) => Text(
                      'msg$i',
                    )),
          ),
        ));
  }
}
