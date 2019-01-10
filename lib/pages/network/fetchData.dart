import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/post.dart';

//获取数据的方法
Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('error');
  }
}

//父类
class FetchData extends StatelessWidget {
  final String title;
  FetchData(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RenderClass(fetchPost()),
    );
  }
}

//渲染数据的子类
class RenderClass extends StatelessWidget {
  RenderClass(this.post);
  final Future<Post> post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: FutureBuilder(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.title,
                style: Theme.of(context).textTheme.headline,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
