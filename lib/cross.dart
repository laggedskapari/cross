import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/widgets/utility_belt.dart';
import 'package:cross/widgets/cross_app_bar.dart';
import 'package:cross/widgets/tasks_view.dart';
import 'package:cross/providers/providers.dart';

class Cross extends ConsumerStatefulWidget {
  const Cross({super.key});

  @override
  ConsumerState<Cross> createState() => _CrossState();
}

class _CrossState extends ConsumerState<Cross> {
  bool isNewTaskVisible = false;

  @override
  void initState(){
    super.initState();
    ref.read(tasksProvider.notifier).loadTasks();
  }


  //Handles the visibility of the new task widget.
  void _toggleNewTaskVisible() {
    setState(() {
      isNewTaskVisible = !isNewTaskVisible;
    });
  }

  @override
  Widget build(BuildContext context) {

    final allRegisteredTasks = ref.watch(allTasksProvider);
    
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
