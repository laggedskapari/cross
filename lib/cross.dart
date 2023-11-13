import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/widgets/utility_belt.dart';
import 'package:cross/widgets/cross_app_bar.dart';
import 'package:cross/widgets/tasks_view.dart';
import 'package:cross/model/task.dart';
import 'package:cross/providers/tasks_provider.dart';

class Cross extends ConsumerStatefulWidget {
  const Cross({super.key});

  @override
  ConsumerState<Cross> createState() => _CrossState();
}

class _CrossState extends ConsumerState<Cross> {
  bool isNewTaskVisible = false;

  //Handles the visibility of the new task widget.
  void _toggleNewTaskVisible() {
    setState(() {
      isNewTaskVisible = !isNewTaskVisible;
    });
  }

  @override
  Widget build(BuildContext context) {

    final allRegisteredTasks = ref.watch(taskProvider);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CrossAppBar(),
      body: TaskView(
        registeredTasks: allRegisteredTasks,
        isNewTaskVisible: isNewTaskVisible,
      ),
      bottomNavigationBar: UtilityBelt(
        toggleNewTask: _toggleNewTaskVisible,
        isNewTaskVisible: isNewTaskVisible,
      ),
    );
  }
}
