import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  final String title;

  FormDemo({Key key, this.title}) : super(key: key);
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildFormItem('用户名'),
              _buildFormItem('密码'),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    print('>>>>>>>>>>>>>>>>>>>>>');
                    print(_formKey.currentContext.size);
                    print(_scaffoldKey.currentContext.size);
                    print(this.context.size);
                    if (_formKey.currentState.validate()) {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text('Validated!'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormItem(String itemName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(itemName),
          TextFormField(
            autofocus: true,
            autovalidate: true,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return '请输入$itemName';
              }
            },
            decoration: InputDecoration(
                icon: itemName == '用户名' ? Icon(Icons.person) : Icon(Icons.lock),
                labelText: '请输入$itemName'),
          ),
        ],
      ),
    );
  }
}
