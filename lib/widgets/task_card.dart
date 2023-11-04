import 'package:flutter/material.dart';
import 'package:cross/model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              '${(task.priority == PRIORITY.high) ? '=>>' : (task.priority == PRIORITY.medium) ? '->>' : '-->' } ${task.taskTitle}',
              style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 20, fontWeight: FontWeight.w700, color: (task.priority == PRIORITY.high) ? const Color.fromARGB(255, 226, 183, 20) : (task.priority == PRIORITY.medium) ? const Color.fromARGB(155, 226, 183, 20) : const Color.fromARGB(100, 226, 183, 20)),
            ),
          ),
        ],
      ),
    );
  }
}
