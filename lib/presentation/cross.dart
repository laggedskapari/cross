import 'package:cross/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/presentation/widgets/cross_app_bar.dart';
import 'package:cross/presentation/widgets/tasks_view.dart';
import 'package:cross/presentation/providers/providers.dart';

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


  @override
  Widget build(BuildContext context) {

    final allRegisteredTasks = ref.watch(allTasksProvider);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CrossAppBar(),
      body: TaskView(
        registeredTasks: allRegisteredTasks,
      ),
    );
  }
}
