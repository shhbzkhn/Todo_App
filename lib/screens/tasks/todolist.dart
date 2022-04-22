import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task.dart';



import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../models/todoList.dart';

class TodoListWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Consumer<TodoListModel>(builder: (context, tasks, child) {
        return ListView(
          children: tasks.tasks.map((TaskModel task) {
            return ChangeNotifierProvider.value(
                value: task, child: TaskWidget());
          }).toList(),
        );
      })),
      Consumer<TodoListModel>(
        builder: (context, tasks, child) {
          return TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'Add New Task'),
            onSubmitted: (newTask) {
              tasks.addTaks(TaskModel(
                  text:
                  newTask)); // create new instance of task changeNotifier model
              _controller.clear(); // clear the text input after adding taks
              tasks.saveTasksToSharedPrefs();
            },
          );
        },
      )
    ]);
  }
}