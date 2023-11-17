import 'package:cross/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTask extends ConsumerStatefulWidget {
  const NewTask({
    super.key,
    required this.isVisible,
  });

  final bool isVisible;

  @override
  ConsumerState<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  bool _showErrorText = false;
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void submitNewTask() {
      if (_titleController.text.trim().isEmpty) {
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

      ref.read(tasksProvider.notifier).addTask(title: _titleController.text.trim());
      setState(() {
        _titleController.text = '';
      });
    }

    return Visibility(
      visible: widget.isVisible,
      child: Column(
        children: [
          Visibility(
            visible: _showErrorText,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('//TITLE NOT FOUND!',
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
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: IconButton(
                    onPressed: submitNewTask,
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
