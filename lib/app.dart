import 'package:flutter/material.dart';
import 'package:cross/widgets/cross_app_bar.dart';
import 'package:cross/widgets/tasks_view.dart';
import 'package:cross/model/task.dart';

class Cross extends StatelessWidget {
  const Cross({super.key});



  @override
  Widget build(BuildContext context) {

    final registeredTasks = [
      Task(taskTitle: 'restart cross', priority: PRIORITY.high, alertTime: DateTime.now()),
      Task(taskTitle: 'complete chapter 3', priority: PRIORITY.medium, alertTime: DateTime.now()),
      Task(taskTitle: 'murder people', priority: PRIORITY.medium, alertTime: DateTime.now()),
      Task(taskTitle: 'standup meeting', priority: PRIORITY.low, alertTime: DateTime.now()),
      Task(taskTitle: 'buy coloring book', priority: PRIORITY.high, alertTime: DateTime.now()),
      Task(taskTitle: 'pay padmini', priority: PRIORITY.medium, alertTime: DateTime.now()),
      Task(taskTitle: 'buy vegies', priority: PRIORITY.low, alertTime: DateTime.now()),
    ];

    return Scaffold(
      appBar: const CrossAppBar(),
      body: TaskView(tasks: registeredTasks)
    );
  }
}
