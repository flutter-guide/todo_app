import 'package:flutter/material.dart';
import 'package:todo_app/data/todo/todo_repository.dart';
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
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        elevation: 2.0,
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
    );
  }
}
