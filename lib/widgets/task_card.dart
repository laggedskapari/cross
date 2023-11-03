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
              '${(task.priority == PRIORITY.high) ? '=>>' : (task.priority == PRIORITY.medium) ? '->>' : '->' } ${task.taskTitle}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(35, 0, 1, 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 19, 21, 23),
                  ),
                  child: Text(
                    '//personal',
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 19, 21, 23),
                ),
                child: Text(
                  '!!!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
