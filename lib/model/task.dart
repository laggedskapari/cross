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
  final DateTime alertTime;

  Task({ required this.taskTitle, required this.priority, required this.alertTime }) : id = uuid.v4();
}