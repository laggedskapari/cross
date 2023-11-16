import 'package:cross/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:cross/domain/entities/task.dart';
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
              onDoubleTap: () {
                setState(() {
                  ref.read(tasksProvider.notifier).unCrossTask(widget.task.id);
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                initialOffset = details.globalPosition.dx;
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                if (details.globalPosition.dx - initialOffset > 100) {
                  setState(() {
                    ref.read(tasksProvider.notifier).crossTask(widget.task.id);
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Icon(
                      (widget.task.isCompleted)
                          ? Icons.done_all_rounded
                          : (widget.task.isImportant)
                              ? Icons.label_important
                              : Icons.double_arrow,
                      color: (widget.task.isCompleted)
                          ? const Color.fromARGB(255, 100, 102, 105)
                          : const Color.fromARGB(255, 226, 183, 20),
                    ),
                  ),
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: (widget.task.isCompleted)
                          ? const Color.fromARGB(255, 100, 102, 105)
                          : const Color.fromARGB(255, 226, 183, 20),
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
