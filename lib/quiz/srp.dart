import 'package:flutter/material.dart';

/// ===============================
/// 1️⃣ PAGE — hanya ngatur layout halaman
/// ===============================
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: TaskList(
        tasks: const [
          Task(title: "Belajar SRP", isDone: true),
          Task(title: "Ngoding Flutter", isDone: false),
        ],
      ),
    );
  }
}

/// ===============================
/// 2️⃣ MODEL — data saja
/// ===============================
class Task {
  final String title;
  final bool isDone;

  const Task({
    required this.title,
    required this.isDone,
  });
}

/// ===============================
/// 3️⃣ LIST — hanya ngurus daftar task
/// ===============================
class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks
          .map(
            (task) => TaskItem(task: task),
      )
          .toList(),
    );
  }
}

/// ===============================
/// 4️⃣ ITEM — hanya satu task
/// ===============================
class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: task.isDone,
      onChanged: (_) {},
      title: Text(task.title),
    );
  }
}
