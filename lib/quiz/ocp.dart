import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ===============================
/// APP
/// ===============================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

/// ===============================
/// MODEL
/// ===============================
class Task {
  final String title;
  const Task(this.title);
}

/// ===============================
/// OCP — ABSTRACTION
/// ===============================
abstract class TaskItemStyle {
  Widget build(Task task);
}

/// ===============================
/// OCP — IMPLEMENTATIONS
/// ===============================
class DoneTaskStyle implements TaskItemStyle {
  @override
  Widget build(Task task) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.green),
      title: Text(task.title),
    );
  }
}

class PendingTaskStyle implements TaskItemStyle {
  @override
  Widget build(Task task) {
    return ListTile(
      leading: const Icon(Icons.hourglass_empty, color: Colors.orange),
      title: Text(task.title),
    );
  }
}

class FailedTaskStyle implements TaskItemStyle {
  @override
  Widget build(Task task) {
    return ListTile(
      leading: const Icon(Icons.close, color: Colors.red),
      title: Text(task.title),
    );
  }
}

/// ===============================
/// WIDGET (TIDAK ADA IF / ELSE)
/// ===============================
class TaskItemOcp extends StatelessWidget {
  final Task task;
  final TaskItemStyle style;

  const TaskItemOcp({
    super.key,
    required this.task,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return style.build(task);
  }
}

/// ===============================
/// PAGE
/// ===============================
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OCP Example")),
      body: ListView(
        children: [
          TaskItemOcp(
            task: const Task("Belajar OCP"),
            style: DoneTaskStyle(),
          ),
          TaskItemOcp(
            task: const Task("Ngoding Flutter"),
            style: PendingTaskStyle(),
          ),
          TaskItemOcp(
            task: const Task("Fix Bug"),
            style: FailedTaskStyle(),
          ),
        ],
      ),
    );
  }
}
