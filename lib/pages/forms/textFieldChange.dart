import 'package:flutter/material.dart';

// 监听文本域变化有两种方法：
// 1.给 TextField 提供 onChange 回调方法，这种方法有缺陷，不能用在 TextFormField 中
// 2. 更加强大的方法是使用 TextEditingController 的监听事件 addListener
class TextFieldChange extends StatefulWidget {
  TextFieldChange({Key key, this.title}) : super(key: key);
  final String title;
  _TextFieldChangeState createState() => _TextFieldChangeState();
}

class _TextFieldChangeState extends State<TextFieldChange> {
  final myController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myController.addListener(_setTextFieldValue);
  }

  _printLatestValue() {
    print('Second Text Field:${myController.text}');
  }

  _setTextFieldValue() {
    if (myController.text == 'hello') {
      myController.text = 'world';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                //这种方式不能用在TextFormField中
                print('first text field:$text');
              },
            ),
            TextField(
              controller: myController,
            )
          ],
        ),
      ),
    );
  }
}
