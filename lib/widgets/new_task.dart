import 'package:cross/model/task.dart';
import 'package:cross/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTask extends ConsumerStatefulWidget {
  const NewTask({
    super.key,
    required this.isVisible,
    required this.registeredTasksList,
  });

  final bool isVisible;
  final List<Task> registeredTasksList;

  @override
  ConsumerState<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  bool _showErrorText = false;
  bool _showErrorPriority = false;
  final _titleController = TextEditingController();
  PRIORITY? _priority;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submitNewTask() {
    if (_titleController.text.trim().isEmpty && _priority == null) {
      setState(() {
        _showErrorText = true;
      });
      Future.delayed(const Duration(seconds: 2)).then((_) {
        setState(() {
          _showErrorText = false;
        });
      });
      return;
    }

    if (_priority == null) {
      setState(() {
        _showErrorPriority = true;
      });
      Future.delayed(const Duration(seconds: 2)).then((_) {
        setState(() {
          _showErrorPriority = false;
        });
      });
      return;
    }

    ref.read(taskProvider.notifier).addNewTask(
          Task(
            taskTitle: _titleController.text.trim(),
            priority: _priority!,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Column(
        children: [
          Visibility(
            visible: _showErrorPriority || _showErrorText,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _showErrorPriority
                    ? '//PRIORITY NOT FOUND!'
                    : _showErrorText
                        ? '//TITLE NOT FOUND'
                        : '',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'JetBrainsMono'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 44, 46, 49),
              borderRadius: BorderRadius.circular(20),
            ),
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
                                          ? const Color.fromARGB(
                                              155, 226, 183, 20)
                                          : const Color.fromARGB(
                                              100, 226, 183, 20),
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
        ],
      ),
    );
  }
}
