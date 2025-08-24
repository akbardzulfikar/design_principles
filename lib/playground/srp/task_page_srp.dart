import 'package:flutter/material.dart';
import '../../features/tasks/domain/task.dart';

// task_item.dart
class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskItem({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: task.isDone,
      onChanged: (_) => onToggle(),
      title: Text(task.title),
    );
  }
}

// task_list.dart
class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(String) onToggle;

  const TaskList({super.key, required this.tasks, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          tasks
              .map((t) => TaskItem(task: t, onToggle: () => onToggle(t.id)))
              .toList(),
    );
  }
}

// task_page.dart
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      Task(id: '1', title: 'Baca SOLID'),
      Task(id: '2', title: 'Refactor kode'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('TaskLite')),
      body: TaskList(
        tasks: tasks,
        onToggle: (id) {
          // nanti dihandle oleh controller
        },
      ),
    );
  }
}
