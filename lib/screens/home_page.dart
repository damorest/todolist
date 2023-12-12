import 'package:flutter/material.dart';
import 'package:todolist/mobx/mobx_state.dart';
import '../model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String newTask;

  final taskStore = TaskStore();


  @override
  Widget build(BuildContext context) {
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
              onChanged: (text) {
                newTask = text;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(taskName: newTask);
                taskStore.addTask(task);
                print('ID : ${task.id}');
                print('IS Done : ${task.isDone}');
                print('Task Name : ${task.taskName}');

              },
              child: const Text('Додати')),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: taskStore.listTasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                      value: taskStore.listTasks[index].isDone,
                      tristate: true,
                      onChanged: (newBool) {
                        setState(() { });
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
        ],
      ),
    );
  }
}
