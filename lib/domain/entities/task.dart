import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {

  Id isarId = Isar.autoIncrement;
  final String id;
  final String title;
  bool isImportant;
  bool isCompleted;

  Task({ required this.id, required this.title, this.isImportant = false, this.isCompleted = false});
}