import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// ===============================
/// 1️⃣ ABSTRAKSI
/// ===============================
abstract class TaskRepository {
  List<String> getAll();
}

/// ===============================
/// 2️⃣ IMPLEMENTASI KONKRIT
/// ===============================
class InMemoryTaskRepository implements TaskRepository {
  final List<String> _tasks = [
    "Belajar DI",
    "Belajar GetIt",
    "Belajar SOLID",
  ];

  @override
  List<String> getAll() => _tasks;
}

/// ===============================
/// 3️⃣ SERVICE LOCATOR (GetIt)
/// ===============================
final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<TaskRepository>(
        () => InMemoryTaskRepository(),
  );
}

/// ===============================
/// 4️⃣ UI (WIDGET)
/// ===============================
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Ambil ABSTRAKSI, bukan class konkret
    final TaskRepository repo = sl<TaskRepository>();
    final tasks = repo.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ListView(
        children: tasks
            .map((t) => ListTile(title: Text(t)))
            .toList(),
      ),
    );
  }
}

/// ===============================
/// 5️⃣ ENTRY POINT
/// ===============================
void main() {
  setupLocator(); // ✅ setup DI di awal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}
