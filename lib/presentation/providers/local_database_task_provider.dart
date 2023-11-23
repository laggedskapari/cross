import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/domain/entities/task.dart';
import 'package:cross/domain/usecases/local_database_usecase.dart';
import 'local_database_usecase_provider.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  final LocalDatabaseUseCase localDatabaseUseCase;

  TaskNotifier({required this.localDatabaseUseCase}) : super([]);

  Future<void> addTask({required String title}) async {
    await localDatabaseUseCase.addTask(title: title);
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> crossTask(String id) async {
    await localDatabaseUseCase.crossTask(id);
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> unCrossTask(String id) async {
    await localDatabaseUseCase.unCrossTask(id);
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await localDatabaseUseCase.deleteTask(id);
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> togglePriority(String id) async {
    await localDatabaseUseCase.togglePriority(id);
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> clearAllTasks() async {
    await localDatabaseUseCase.clearAllTasks();
    state = await localDatabaseUseCase.loadTasks();
  }

  Future<void> loadTasks() async {
    state = await localDatabaseUseCase.loadTasks();
  }
}

final tasksProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  final localDatabaseUseCase = ref.watch(localDatabaseUseCaseProvider);
  return TaskNotifier(localDatabaseUseCase: localDatabaseUseCase);
});

final allTasksProvider = Provider<List<Task>>((ref) {
  final allTasks = ref.watch(tasksProvider);
  return allTasks;
});
