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

  @action
  void toggleDone(String taskName, int index) {

    if(listTasks[index].isDone == false) {
      listTasks[index] = TaskModel(taskName: taskName, isDone: true);
    } else {
      listTasks[index] = TaskModel(taskName: taskName, isDone: false);
    }
  }
  @computed
  ObservableList<TaskModel> notComletedTasks() {
    return ObservableList.of(listTasks.where((element) => element.isDone == false).toList());
  }

  @computed
  List<TaskModel> comletedTasks() {
    return listTasks.where((element) => element.isDone == true).toList();
  }


}