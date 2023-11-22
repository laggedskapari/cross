import '../entities/task.dart';

abstract class LocalDatabaseRepo {
  Future<List<Task>> loadTasks();
  Future<void> deleteTask(String id);
  Future<void> addTask({required String title});
  Future<void> crossTask(String id);
  Future<void> unCrossTask(String id);
  Future<void> togglePriority(String id);
}