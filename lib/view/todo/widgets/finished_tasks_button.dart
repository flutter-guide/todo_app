import 'package:flutter/material.dart';

class ToggleTaskSectionButton extends StatelessWidget {
  const ToggleTaskSectionButton({
    super.key,
    required this.showFinishedTasks,
    required this.toggle,
    required this.title,
    this.backgroundColor = Colors.lightGreen,
  });

  final String title;
  final VoidCallback toggle;
  final bool showFinishedTasks;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggle,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor.withOpacity(.2)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("  $title",),
            Icon(
              showFinishedTasks
                  ? Icons.arrow_drop_down_rounded
                  : Icons.arrow_drop_up_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
