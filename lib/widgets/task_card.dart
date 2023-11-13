import 'package:cross/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:cross/model/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCard extends ConsumerStatefulWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  ConsumerState<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {

  double initialOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: GestureDetector(
              onDoubleTap: (){
                setState(() {
                  ref.read(taskProvider.notifier).uncrossTask(widget.task);
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                initialOffset = details.globalPosition.dx;
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                if (details.globalPosition.dx - initialOffset > 100) {
                  setState(() {
                    ref.read(taskProvider.notifier).crossTask(widget.task);
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Icon((widget.task.isCompleted) ? Icons.done_all_rounded : (widget.task.priority == PRIORITY.high) ? Icons.label_important : (widget.task.priority == PRIORITY.medium) ? Icons.double_arrow : Icons.arrow_forward_ios, color: (widget.task.isCompleted)
                        ? const Color.fromARGB(255, 100, 102, 105)
                        : (widget.task.priority == PRIORITY.high)
                        ? const Color.fromARGB(255, 226, 183, 20)
                        : (widget.task.priority == PRIORITY.medium)
                        ? const Color.fromARGB(155, 226, 183, 20)
                        : const Color.fromARGB(100, 226, 183, 20),),
                  ),
                  Text(
                    widget.task.taskTitle,
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: (widget.task.isCompleted)
                          ? const Color.fromARGB(255, 100, 102, 105)
                          : (widget.task.priority == PRIORITY.high)
                              ? const Color.fromARGB(255, 226, 183, 20)
                              : (widget.task.priority == PRIORITY.medium)
                                  ? const Color.fromARGB(155, 226, 183, 20)
                                  : const Color.fromARGB(100, 226, 183, 20),
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
