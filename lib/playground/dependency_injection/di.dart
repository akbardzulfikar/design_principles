import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// ===== ABSTRAKSI (kontrak stabil) =====
abstract class TaskRepository {
  List<String> getAll();
}

// ===== IMPLEMENTASI A: InMemory =====
class InMemoryTaskRepository implements TaskRepository {
  final List<String> _tasks = ["Belajar GetIt (GOOD)", "Refactor ke DIP"];
  @override
  List<String> getAll() => _tasks;
}

// ===== IMPLEMENTASI B: Remote (simulasi) =====
class RemoteTaskRepository implements TaskRepository {
  @override
  List<String> getAll() => ["Remote Task A", "Remote Task B"];
}

// ===== CONTROLLER (bergantung pada abstraksi) =====
class TaskController {
  final TaskRepository repo;
  TaskController(this.repo);

  List<String> load() => repo.getAll();
}

// ===== COMPOSITION ROOT (Service Locator) =====
void setupLocatorDi() {
  // ✅ daftar abstraksi → mudah diganti
  sl.registerLazySingleton<TaskRepository>(() => InMemoryTaskRepository());
  // ganti ke remote cukup di sini:
  // sl.registerLazySingleton<TaskRepository>(() => RemoteTaskRepository());

  // Register controller sebagai factory, depend ke abstraksi
  sl.registerFactory<TaskController>(
    () => TaskController(sl<TaskRepository>()),
  );
}

class TaskPageGood extends StatelessWidget {
  const TaskPageGood({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Resolve sekali (komposisi), konsumsi via abstraksi
    final controller = sl<TaskController>();
    final tasks = controller.load();

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks — GOOD (Service Locator)")),
      body: ListView(
        children: tasks.map((t) => ListTile(title: Text(t))).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Demo swap implementasi tanpa sentuh widget:
          sl.unregister<TaskRepository>();
          sl.registerLazySingleton<TaskRepository>(
            () => RemoteTaskRepository(),
          );
          // Biasanya trigger re-build via state mgmt; ini hanya ilustrasi swap.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Switched to RemoteTaskRepository')),
          );
        },
        label: const Text('Swap to Remote'),
        icon: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
