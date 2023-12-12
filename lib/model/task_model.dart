import 'package:uuid/uuid.dart';

class TaskModel {
  final String id;
  final String taskName;
  final bool isDone;

  TaskModel({
    String? id,
    required this.taskName,
    this.isDone = false
  })
      : id = id ?? Uuid().v4();
}