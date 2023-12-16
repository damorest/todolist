import 'package:flutter/material.dart';

import '../model/task_model.dart';

class CompletedPage extends StatelessWidget {
  final List<TaskModel> taskComplit;

  const CompletedPage({super.key, required this.taskComplit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Виконані завдання'),
        ),
        body: ListView.builder(
          itemCount: taskComplit.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(taskComplit[index].taskName),
            );
          },
        ));
  }
}
