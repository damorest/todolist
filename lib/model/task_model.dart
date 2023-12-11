import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String taskName;
  final bool isDone;

  Task({
    String? id,
    required this.taskName,
    this.isDone = false
  })
      : id = id ?? Uuid().v4();
}