import 'package:flutter/material.dart';
import 'package:cross/model/task.dart';

class TaskCard extends StatefulWidget {
  TaskCard({super.key, required this.task, required this.isTaskCompleted});

  final Task task;
  bool isTaskCompleted = false;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
                  widget.isTaskCompleted = false;
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                initialOffset = details.globalPosition.dx;
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                if (details.globalPosition.dx - initialOffset > 100) {
                  setState(() {
                    widget.isTaskCompleted = true;
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Icon((widget.isTaskCompleted) ? Icons.done_all_rounded : (widget.task.priority == PRIORITY.high) ? Icons.label_important : (widget.task.priority == PRIORITY.medium) ? Icons.double_arrow : Icons.arrow_forward_ios, color: (widget.isTaskCompleted)
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
                      color: (widget.isTaskCompleted)
                          ? const Color.fromARGB(255, 100, 102, 105)
                          : (widget.task.priority == PRIORITY.high)
                              ? const Color.fromARGB(255, 226, 183, 20)
                              : (widget.task.priority == PRIORITY.medium)
                                  ? const Color.fromARGB(155, 226, 183, 20)
                                  : const Color.fromARGB(100, 226, 183, 20),
                      decoration: widget.isTaskCompleted
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
