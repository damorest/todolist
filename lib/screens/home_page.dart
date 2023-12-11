import 'package:flutter/material.dart';
import '../model/task_model.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var uuid = Uuid();

  late String newTask;

  void deleteTask(List tasks, int index) {
    tasks.removeAt(index);
  }

  void addTask(List tasks, inputText) {
    tasks.add(inputText);
  }

  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    var v4 = uuid.v4();

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
                Task task = Task(v4, newTask, false);
                addTask(taskList, task);
                setState(() { });
                print('ID : ${task.id}');
                print('IS Done : ${task.isDone}');
                print('Task Name : ${task.taskName}');

              },
              child: const Text('Додати')),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // leading: Checkbox(
                  //     value: task.isDone,
                  //     tristate: true,
                  //     onChanged: (newBool) {
                  //       setState(() {
                  //
                  //       });
                  //     } ),
                  title: Text(taskList[index].taskName),
                  trailing: IconButton(
                    onPressed: () {
                      deleteTask(taskList, index);
                      print('Task id : ${taskList.last.id}');
                      setState(() {});
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
