import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/domain/firebase/datastore/todo_api.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/view/todo/widgets/finished_tasks_button.dart';
import 'package:todo_app/view/todo/widgets/todo_card.dart';

import '../../data/todo/todo_repository.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final TodoRepository todoRepository = TodoRepository(TodoApi());

  bool showPendingTasks = true;
  bool showFinishedTasks = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: StreamBuilder<List<Todo>>(
        stream: todoRepository.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return ListView(
              children: [
                ToggleTaskSectionButton(
                  title: "Pending Tasks",
                  backgroundColor: Colors.amber,
                  showFinishedTasks: showPendingTasks,
                  toggle: () {
                    setState(() => showPendingTasks = !showPendingTasks);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                if (snapshot.data!.where((element) => !element.done).isEmpty &&
                    showPendingTasks)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        "No pending tasks found!",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                if (showPendingTasks)
                  for (final todo
                      in snapshot.data!.where((element) => !element.done))
                    TodoCard(
                      todo: todo,
                      todoRepository: todoRepository,
                    ),
                const SizedBox(
                  height: 15,
                ),
                ToggleTaskSectionButton(
                  title: "Finished Tasks",
                  showFinishedTasks: showFinishedTasks,
                  toggle: () {
                    setState(() => showFinishedTasks = !showFinishedTasks);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                if (showFinishedTasks)
                  for (final todo
                      in snapshot.data!.where((element) => element.done))
                    TodoCard(
                      todo: todo,
                      todoRepository: todoRepository,
                    ),
              ],
            );
          } else if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("App restart required!"),
            );
          }
        },
      ),
    );
  }
}
