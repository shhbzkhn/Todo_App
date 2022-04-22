import 'package:flutter/material.dart';

import '../../models/todoList.dart';

class CompletedTasks extends StatelessWidget {
  final TodoListModel todoList;

  CompletedTasks({required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Completed Tasks'),
          elevation: 20,
        ),
        body: ListView(
            children: todoList.getCompletedTasks().map((t) {
          return Container(
              height: 50,
              child:
                  Center(child: Text(t.text, style: TextStyle(fontSize: 20))));
        }).toList()));
  }
}
