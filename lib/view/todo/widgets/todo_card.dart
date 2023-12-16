import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/data/todo/todo_repository.dart';
import 'package:todo_app/domain/firebase/datastore/todo_api.dart';
import 'package:todo_app/domain/models/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todoRepository,
    required this.todo,
  });

  final TodoRepository todoRepository;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        elevation: 2.0,
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: (context)=>{
                TodoRepository(TodoApi()).deleteTask(todo.id!),
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12.0),
            )
          ]),
          child: ListTile(
            title: Text(
              todo.title,
            ),
            leading: IconButton(
              onPressed: () => todoRepository.toggleDone(todo.id!),
              icon: Icon(
                todo.done ? Icons.check_circle : Icons.radio_button_unchecked,
                color: todo.done ? Theme.of(context).primaryColor : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
