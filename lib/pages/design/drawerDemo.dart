import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  // color: Colors.deepOrange,
                  fontSize: 16,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              // image: DecorationImage(image: NetworkImage('http://www.pptbz.com/pptpic/UploadFiles_6909/201211/2012111719294197.jpg')),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
