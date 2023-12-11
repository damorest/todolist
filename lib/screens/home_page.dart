import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Task? task;
  bool? _isDone = false;
  late String newTask;


  void deleteTask(List tasks, int index) {
    tasks.removeAt(index);
  }

  void addTask(List tasks, String inputText) {
    tasks.add(inputText);
  }

  List<String> taskList = [];

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
                setState(() { });
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {
            addTask(taskList, newTask );
            setState(() {

            });
          }, child: const Text('Додати')),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                      leading: Checkbox(
                          value: _isDone,
                          tristate: true,
                          onChanged: (newBool) {
                            setState(() {
                              _isDone = newBool;
                            });
                          } ),
                      title: Text(taskList[index]),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTask(taskList, index);
                          print(taskList.toString());
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete_sweep,
                            color: Colors.redAccent),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
