import 'package:cross/widgets/utility_belt.dart';
import 'package:flutter/material.dart';
import 'package:cross/widgets/cross_app_bar.dart';
import 'package:cross/widgets/tasks_view.dart';
import 'package:cross/model/task.dart';

class Cross extends StatefulWidget {
  const Cross({super.key});

  @override
  State<Cross> createState() => _CrossState();
}

class _CrossState extends State<Cross> {
  bool isNewTaskVisible = false;

  void _toggleNewTaskVisible() {
    setState(() {
      isNewTaskVisible = !isNewTaskVisible;
    });
    print(isNewTaskVisible);
  }

  @override
  Widget build(BuildContext context) {
    final registeredTasks = [
      Task(
          taskTitle: 'restart cross',
          priority: PRIORITY.high,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'complete chapter 3',
          priority: PRIORITY.medium,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'murder people',
          priority: PRIORITY.medium,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'standup meeting',
          priority: PRIORITY.low,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'buy coloring book',
          priority: PRIORITY.high,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'pay padmini',
          priority: PRIORITY.medium,
          alertTime: DateTime.now()),
      Task(
          taskTitle: 'buy vegies',
          priority: PRIORITY.low,
          alertTime: DateTime.now()),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CrossAppBar(),
      body: TaskView(
        tasks: registeredTasks,
        isNewTaskVisible: isNewTaskVisible,
      ),
      bottomNavigationBar: UtilityBelt(
        toggleNewTask: _toggleNewTaskVisible,
        isNewTaskVisible: isNewTaskVisible,
      ),
    );
  }
}
