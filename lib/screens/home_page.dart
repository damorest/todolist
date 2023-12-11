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
  bool _isDone = false;

  void changeStatus () {
    _isDone = !_isDone;
  }

  List<String> taskList = ['buy water', 'check email'];

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
            child: Text('Список справ :',
            style: TextStyle(
              fontSize: 25,
            ) ,
            ),
          ),
          ListView.builder(
            shrinkWrap:true,
            scrollDirection: Axis.vertical,
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                // leading: Checkbox(value: task!.isDone, onChanged: () {
                //   changeStatus();
                // } ),
                title: Text(taskList[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
