import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todolist/mobx/mobx_state.dart';
import '../model/task_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int allFilter = 0;
  static const int completedFilter = 1;
  static const int notCompletedFilter = 2;

  int currentFilter = allFilter;

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

    ObservableList<TaskModel> getTaskList () {
      switch (currentFilter) {
      case allFilter:
        return taskStore.listTasks;
      case completedFilter:
        return taskStore.comletedTasks();
        case notCompletedFilter:
          return taskStore.notComletedTasks();
        default:
          return taskStore.listTasks;
      }
    }

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
                print('Довжина : ${taskStore.quantityNotCompletedTask()}');
                },
              child: const Text('Додати')),
          const SizedBox(height: 30),
          const Text('Фільтри'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  currentFilter = allFilter;
                });

              }, child: const Text('Всі ')),
              ElevatedButton(onPressed: () {
                setState(() {
                  currentFilter = completedFilter;
                });
              },
                  child: const Text('Виконані ')),
              ElevatedButton(onPressed: () {
                setState(() {
                  currentFilter = notCompletedFilter;
                });
                }, child: Observer(builder: (_) => Text('Не виконані ${taskStore.quantityNotCompletedTask()}'))),
            ],
          ),
          Expanded(
            child: Observer(
              builder:(_) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: getTaskList().length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Checkbox(
                        value: getTaskList()[index].isDone,
                        tristate: true,
                        onChanged: (newBool) {
                         taskStore.toggleDone(getTaskList()[index].taskName, index);
                        } ),
                    title: Text(getTaskList()[index].taskName),
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
