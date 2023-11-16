import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/domain/firebase/datastore/todo_api.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/view/todo/widgets/todo_card.dart';

import '../../data/todo/todo_repository.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});

  final TodoRepository todoRepository = TodoRepository(TodoApi());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: StreamBuilder<List<Todo>>(
        stream: todoRepository.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                Todo todo = snapshot.data!.elementAt(index);
                return TodoCard(
                  todo: todo,
                  todoRepository: todoRepository,
                );
              },
              itemCount: snapshot.data!.length,
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
