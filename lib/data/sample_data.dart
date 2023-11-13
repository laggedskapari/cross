import 'package:cross/model/task.dart';

List<Task> sampleTasks = [
  Task(
    taskTitle: 'restart cross',
    priority: PRIORITY.high,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'complete chapter 3',
    priority: PRIORITY.medium,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'learn state management in flutter.',
    priority: PRIORITY.medium,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'standup meeting',
    priority: PRIORITY.low,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'buy coloring book',
    priority: PRIORITY.high,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'pay mimi',
    priority: PRIORITY.medium,
    alertTime: DateTime.now(),
  ),
  Task(
    taskTitle: 'buy vegies',
    priority: PRIORITY.low,
    alertTime: DateTime.now(),
  ),
];
