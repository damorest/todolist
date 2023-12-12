import 'package:mobx/mobx.dart';
import '../model/task_model.dart';
part 'mobx_state.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<TaskModel> listTasks = ObservableList<TaskModel>();

  @action
  void addTask(TaskModel task) {
    listTasks.add(task);
  }

  @action
  void deleteTask(int index) {
    listTasks.removeAt(index);
  }

}