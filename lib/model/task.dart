import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum PRIORITY {
  high,
  medium,
  low
}

class Task {
  final String id;
  final String taskTitle;
  final PRIORITY priority;
  bool isCompleted;

  Task({ required this.taskTitle, required this.priority, this.isCompleted = false }) : id = uuid.v4();
}