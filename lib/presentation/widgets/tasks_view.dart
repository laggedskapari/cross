import 'package:cross/presentation/providers/local_database_task_provider.dart';
import 'package:flutter/material.dart';
import 'package:cross/presentation/widgets/task_card.dart';
import 'package:cross/domain/entities/task.dart';
import 'package:cross/presentation/widgets/new_task.dart';
import 'package:cross/presentation/widgets/day_time_insight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskView extends ConsumerWidget {
  const TaskView({
    super.key,
    required this.registeredTasks,
    required this.isNewTaskVisible,
  });

  final List<Task> registeredTasks;
  final bool isNewTaskVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DayTimeInsight(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Dismissible(
              key: Key(registeredTasks[index].id),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection endToStart) {
                ref
                    .watch(tasksProvider.notifier)
                    .deleteTask(registeredTasks[index].id);
              },
              background: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 202, 71, 84),
              ),
              secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  color: const Color.fromARGB(255, 202, 71, 84),
                  child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: TaskCard(
                task: registeredTasks[index],
              ),
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
