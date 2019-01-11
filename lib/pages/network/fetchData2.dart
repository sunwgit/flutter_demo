import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../model/photo.dart';

//获取数据的方法
Future<List<Photo>> fetchPhoto(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('error');
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

//父类
class FetchData2 extends StatelessWidget {
  final String title;
  FetchData2(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
          future: fetchPhoto(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              throw Exception(snapshot.error);
            } else if (snapshot.hasData) {
              return PhotoList(snapshot.data);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;
  PhotoList(this.photos);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: photos.length,
      itemBuilder: (context, i) {
        return Image.network(photos[i].thumbnailUrl);
      },
    );
  }
}
