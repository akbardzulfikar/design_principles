import '../domain/task.dart';
import '../domain/read_tasks.dart';
import '../domain/write_tasks.dart';

class InMemoryTaskRepository implements ReadTasks, WriteTasks {
  final List<Task> _store = [
    const Task(id: '1', title: 'Read SOLID'),
    const Task(id: '2', title: 'Refactor TaskPage'),
    const Task(id: '3', title: 'Write one unit test'),
  ];

  @override
  Future<List<Task>> fetchTasks() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.unmodifiable(_store);
  }

  @override
  Future<Task> toggle(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final idx = _store.indexWhere((t) => t.id == id);
    if (idx == -1) throw StateError('Not found');
    final toggled = _store[idx].toggle();
    _store[idx] = toggled;
    return toggled;
  }
}
