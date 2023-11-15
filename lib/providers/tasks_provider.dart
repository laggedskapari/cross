import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cross/model/task.dart';

class TaskProvider extends Notifier<List<Task>>{
  @override
  List<Task> build() {
    return [];
  }

  void addNewTask(Task newTask){
    state = [...state, newTask];
  }

  void crossTask(Task task){
    if(!task.isCompleted){
      task.isCompleted = !task.isCompleted;
    }
  }

  void unCrossTask(Task task){
    if(task.isCompleted){
      task.isCompleted = !task.isCompleted;
    }
  }
}

final taskProvider = NotifierProvider<TaskProvider, List<Task>>(TaskProvider.new);