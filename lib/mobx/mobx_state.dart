import 'package:mobx/mobx.dart';
import '../model/task_model.dart';

class TaskStore {
  final ObservableList<TaskModel> listTasks = ObservableList<TaskModel>();

  void addTask(TaskModel task) {
    listTasks.add(task);
  }

  void deleteTask(int index) {
    listTasks.removeAt(index);
  }

}