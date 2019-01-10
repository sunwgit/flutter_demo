import 'package:flutter/material.dart';
import '../../model/todo.dart';

class PassDataDemo extends StatelessWidget {
  final String title;
  PassDataDemo(this.title);
  @override
  Widget build(BuildContext context) {
    final todos = List.generate(
        10, (i) => Todo('Todo $i', 'This is a description of Todo-$i'));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, i) => ListTile(
              title: Text(todos[i].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen('SecondScreen', todos[i])));
              },
            ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen(this.title, this.todo);
  final String title;
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          todo.description,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
