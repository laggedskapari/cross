import 'package:cross/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:cross/domain/entities/task.dart';
import 'package:flutter/services.dart';
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  if (!widget.task.isCompleted) {
                    ref
                        .read(tasksProvider.notifier)
                        .togglePriority(widget.task.id);
                    HapticFeedback.vibrate();
                  }
                });
              },
              onDoubleTap: () {
                if (widget.task.isCompleted) {
                  setState(() {
                    ref
                        .read(tasksProvider.notifier)
                        .unCrossTask(widget.task.id);
                    HapticFeedback.lightImpact();
                  });
                }
              },
              onHorizontalDragStart: (DragStartDetails details) {
                initialOffset = details.globalPosition.dx;
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                if (details.globalPosition.dx - initialOffset > 100 &&
                    !widget.task.isCompleted) {
                  setState(() {
                    ref.read(tasksProvider.notifier).crossTask(widget.task.id);
                    HapticFeedback.heavyImpact();
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
                          : (widget.task.isImportant)
                              ? const Color.fromARGB(255, 226, 183, 20)
                              : const Color.fromARGB(150, 226, 183, 20),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90,
                    child: Text(
                      widget.task.title,
                      style: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: (widget.task.isCompleted)
                            ? const Color.fromARGB(255, 100, 102, 105)
                            : (widget.task.isImportant)
                                ? const Color.fromARGB(255, 226, 183, 20)
                                : const Color.fromARGB(150, 226, 183, 20),
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
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
