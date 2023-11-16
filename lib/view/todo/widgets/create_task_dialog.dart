import 'package:flutter/material.dart';

class CreateTaskDialog extends StatelessWidget {
  CreateTaskDialog({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("New Task"),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(label: Text("My Task")),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            controller.text,
          ),
          child: const Text("Create task"),
        ),
      ],
    );
  }
}
