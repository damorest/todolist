import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

class TaskModel {
  final String id;
  final String taskName;
  @observable
  bool isDone;

  TaskModel({
    String? id,
    required this.taskName,
    this.isDone = false
  })
      : id = id ?? Uuid().v4();
  @action
  void toggleDone() {
      isDone = !isDone;
  }
}