import 'package:flutter/material.dart';
import '../../domain/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Future<void> Function(String) onToggle;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (_, i) {
        final task = tasks[i];
        return TaskItem(task: task, onToggle: () => onToggle(task.id));
      },
    );
  }
}
