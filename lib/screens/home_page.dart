import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/mobx/mobx_state.dart';
import '../model/task_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String newTask;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final taskStore = context.watch<TaskStore>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'ToDo List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Список справ :',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: _textEditingController,
              onChanged: (text) {
                newTask = text;
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(taskName: newTask);
                taskStore.addTask(task);
                _textEditingController.clear();
                },
              child: const Text('Додати')),
          Expanded(
            child: Observer(
              builder:(_) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: taskStore.listTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Checkbox(
                        value: taskStore.listTasks[index].isDone,
                        tristate: true,
                        onChanged: (newBool) {
                         taskStore.toggleDone(taskStore.listTasks[index].taskName, index);
                        } ),
                    title: Text(taskStore.listTasks[index].taskName),
                    trailing: IconButton(
                      onPressed: () {
                        taskStore.deleteTask(index);
                      },
                      icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
