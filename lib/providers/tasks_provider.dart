import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/model/task.dart';



class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super([]);

  void addNewTask(Task newTask){
    final isTaskPresent = state.contains(newTask);

    if(!isTaskPresent){
      state = [...state, newTask];
    }
  }

  void crossTask(Task task){
    final isTaskPresent = state.contains(task);

    if(isTaskPresent){
      task.isCompleted = true;
    }
  }

  void uncrossTask(Task task){
    final isTaskPresent = state.contains(task);

    if(isTaskPresent){
      task.isCompleted = false;
    }
  }
}

final taskProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  return TasksNotifier();
});