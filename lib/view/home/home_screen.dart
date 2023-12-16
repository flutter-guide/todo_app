import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/todo/todo_repository.dart';
import 'package:todo_app/domain/firebase/datastore/todo_api.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/view/common/navigation/default_drawer.dart';
import 'package:todo_app/view/todo/widgets/create_task_dialog.dart';

import '../todo/todo_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DefaultDrawer(),
        appBar: AppBar(
          title: const Text("My Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String? todoText = await showDialog<String>(
              context: context,
              builder: (context) {
                return CreateTaskDialog();
              },
            );
            if (todoText != null) {
              if (todoText.isNotEmpty) {
                TodoRepository(TodoApi()).createTodo(Todo(id: "", title: todoText, done: false,),);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Task created!"),
                    backgroundColor: Colors.lightGreen,
                  ),
                );
              }
            }
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: ToDoPage());
  }
}
