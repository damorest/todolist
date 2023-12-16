import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/task_model.dart';

class NotCompleteScreen extends StatelessWidget {
  final ObservableList<TaskModel> taskNotComplit;

  const NotCompleteScreen({super.key, required this.taskNotComplit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Невиконані завдання'),
        ),
        body: ListView.builder(
          itemCount: taskNotComplit.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(taskNotComplit[index].taskName),
            );
          },
        ));
  }
}
