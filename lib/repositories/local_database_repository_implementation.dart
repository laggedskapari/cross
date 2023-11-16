import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:cross/domain/entities/task.dart';
import 'package:cross/domain/repositories/local_database_repo.dart';

class LocalDatabaseRepositoryImplementation extends LocalDatabaseRepo {
  late Future<Isar> db;

  LocalDatabaseRepositoryImplementation() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([TaskSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> addTask({ required String title }) async {
    final Isar isar = await db;
    const uuid = Uuid();
    await isar.writeTxn(() async {
      final newTask = Task(id: uuid.v4(), title: title);
      await isar.tasks.put(newTask);
    });
  }

  @override
  Future<void> deleteTask(String id) async {
    final Isar isar = await db;
    final Task? task = await isar.tasks.filter().idEqualTo(id).findFirst();
    if(task != null){
      await isar.writeTxn(() async {
        await isar.tasks.delete(task.isarId);
      });
    }
  }

  @override
  Future<void> crossTask(String id) async {
    final Isar isar = await db;
    await isar.writeTxn(() async {
      final Task? task = await isar.tasks.filter().idEqualTo(id).findFirst();
      if(task != null){
        task.isCompleted = true;
        await isar.tasks.put(task);
      }
    });
  }

  @override
  Future<void> unCrossTask(String id) async {
    final Isar isar = await db;
    await isar.writeTxn(() async {
      final Task? task = await isar.tasks.filter().idEqualTo(id).findFirst();
      if(task != null){
        task.isCompleted = false;
        await isar.tasks.put(task);
      }
    });
  }

  @override
  Future<List<Task>> loadTasks() async {
    final Isar isar = await db;
    final tasks = await isar.tasks.where(sort: Sort.desc).anyIsarId().findAll();
    return tasks;
  }
}