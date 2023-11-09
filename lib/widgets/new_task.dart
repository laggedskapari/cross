import 'package:cross/model/task.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({
    super.key,
    required this.isVisible,
    required this.registeredTasksList,
    required this.addNewTask
  });

  final void Function(Task newTask) addNewTask;
  final bool isVisible;
  final List<Task> registeredTasksList;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  PRIORITY _priority = PRIORITY.low;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submitNewTask() {
    widget.addNewTask(Task(taskTitle: _titleController.text, priority: _priority, alertTime: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 46, 49),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: TextField(
                  controller: _titleController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: '//TITLE',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: false,
                  iconSize: 0,
                  value: _priority,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _priority = value;
                      print(_priority);
                    });
                  },
                  hint: Text(
                    '//PRIORITY',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  dropdownColor: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                  items: PRIORITY.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(
                            type.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: (type == PRIORITY.high)
                                  ? const Color.fromARGB(255, 226, 183, 20)
                                  : (type == PRIORITY.medium)
                                      ? const Color.fromARGB(155, 226, 183, 20)
                                      : const Color.fromARGB(100, 226, 183, 20),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                onPressed: _submitNewTask,
                icon: const Icon(Icons.check),
                splashRadius: 1,
                color: const Color.fromARGB(255, 100, 102, 105),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
