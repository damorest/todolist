// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$listTasksAtom =
      Atom(name: '_TaskStore.listTasks', context: context);

  @override
  ObservableList<TaskModel> get listTasks {
    _$listTasksAtom.reportRead();
    return super.listTasks;
  }

  @override
  set listTasks(ObservableList<TaskModel> value) {
    _$listTasksAtom.reportWrite(value, super.listTasks, () {
      super.listTasks = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void addTask(TaskModel task) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(int index) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.deleteTask');
    try {
      return super.deleteTask(index);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDone(String taskName, int index) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.toggleDone');
    try {
      return super.toggleDone(taskName, index);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTasks: ${listTasks}
    ''';
  }
}
