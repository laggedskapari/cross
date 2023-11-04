import 'package:flutter/material.dart';
import 'package:cross/widgets/task_card.dart';
import 'package:cross/model/task.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30, 20, 0, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '//NOV 3 2023',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                '08h 23m left',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '//56.99898 completed',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskCard(
              task: tasks[index],
            ),
            itemCount: tasks.length,
          ),
        ),
      ],
    );
  }
}
