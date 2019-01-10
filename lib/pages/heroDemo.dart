import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  HeroDemo(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SecondScreen('SecondScreen'),
              ));
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
              'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547113267138&di=af8493e376db56b5ffbe22a30b39429c&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171113%2Fc5052d30a1044788bef805561d461886.jpeg'),
        ),
      ),
    );
  }
}
