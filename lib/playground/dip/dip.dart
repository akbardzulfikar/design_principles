import 'package:flutter/material.dart';

// ✅ Abstraksi
abstract class TaskRepository {
  List<String> getAll();
}

// Implementasi A
class InMemoryTaskRepositoryDip implements TaskRepository {
  final List<String> _tasks = ["Belajar Flutter", "Belajar DIP"];

  @override
  List<String> getAll() => _tasks;
}

// Implementasi B
class RemoteTaskRepositoryDip implements TaskRepository {
  @override
  List<String> getAll() {
    // simulasi API
    return ["Remote Task 1", "Remote Task 2"];
  }
}

// High-level Widget
class TaskPageDip extends StatelessWidget {
  final TaskRepository repo; // ✅ tergantung abstraksi

  const TaskPageDip({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final tasks = repo.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ListView(
        children: tasks.map((t) => ListTile(title: Text(t))).toList(),
      ),
    );
  }
}
