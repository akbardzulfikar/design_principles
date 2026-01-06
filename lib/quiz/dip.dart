import 'package:flutter/material.dart';

/// ===============================
/// 1️⃣ ABSTRAKSI (DIP DIMULAI DI SINI)
/// ===============================
abstract class TaskRepository {
  List<String> getAll();
}

/// ===============================
/// 2️⃣ IMPLEMENTASI DETAIL
/// ===============================
class InMemoryTaskRepository implements TaskRepository {
  final List<String> _tasks = [
    "Belajar Flutter",
    "Belajar DIP",
  ];

  @override
  List<String> getAll() => _tasks;
}

/// ===============================
/// 3️⃣ UI TIDAK TAHU DETAIL IMPLEMENTASI
/// ===============================
class TaskPage extends StatelessWidget {
  final TaskRepository repo;

  const TaskPage({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    final tasks = repo.getAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: ListView(
        children: tasks
            .map(
              (task) => ListTile(
            title: Text(task),
          ),
        )
            .toList(),
      ),
    );
  }
}

/// ===============================
/// 4️⃣ WIRING (MAIN / ENTRY POINT)
/// ===============================
void main() {
  runApp(
    MaterialApp(
      home: TaskPage(
        repo: InMemoryTaskRepository(),
      ),
    ),
  );
}
