import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// ===== ANTI-CONTOH: DAFTAR TIPE KONKRIT =====
void setupBadLocator() {
  sl.registerSingleton<InMemoryTaskRepository>(InMemoryTaskRepository());
}

// ====== TIPE KONKRIT ======
class InMemoryTaskRepository {
  final List<String> _tasks = ["Belajar GetIt (ANTI)", "Task lokal"];
  List<String> getAll() => _tasks;
}

class TaskPageBad extends StatelessWidget {
  const TaskPageBad({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ Hidden dependency + bergantung ke detail
    final repo = sl<InMemoryTaskRepository>();
    final tasks = repo.getAll();

    return ListView(
      children: tasks.map((t) => ListTile(title: Text(t))).toList(),
    );
  }
}
