import 'package:flutter/material.dart';
import 'package:cross/presentation/widgets/task_card.dart';
import 'package:cross/domain/entities/task.dart';
import 'package:cross/presentation/widgets/new_task.dart';
import 'package:cross/presentation/widgets/day_time_insight.dart';

class TaskView extends StatelessWidget {

  const TaskView({
    super.key,
    required this.registeredTasks,
    required this.isNewTaskVisible,
  });

  final List<Task> registeredTasks;
  final bool isNewTaskVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DayTimeInsight(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskCard(
              task: registeredTasks[index],
            ),
            itemCount: registeredTasks.length,
          ),
        ),
        NewTask(
          isVisible: isNewTaskVisible,
        ),
      ],
    );
  }
}
