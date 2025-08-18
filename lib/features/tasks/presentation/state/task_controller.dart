import 'package:flutter/foundation.dart';
import '../../../../core/filters/task_filter.dart';
import '../../domain/task.dart';
import '../../domain/read_tasks.dart';
import '../../domain/write_tasks.dart';

class TaskController extends ChangeNotifier {
  TaskController({
    required ReadTasks reader,
    WriteTasks? writer, // optional (remote may not provide it)
  }) : _reader = reader,
       _writer = writer;

  final ReadTasks _reader;
  final WriteTasks? _writer;

  List<Task> _all = [];
  bool _loading = false;
  TaskFilter _filter = AllFilter();

  List<Task> get tasks => _filter.apply(_all);
  bool get loading => _loading;
  TaskFilter get filter => _filter;

  Future<void> load() async {
    _loading = true;
    notifyListeners();
    try {
      _all = await _reader.fetchTasks();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> toggle(String id) async {
    if (_writer != null) {
      final updated = await _writer.toggle(id);
      _all = _all.map((t) => t.id == id ? updated : t).toList();
    } else {
      // No writer available (e.g., remote read-only): optimistic local flip
      _all = _all.map((t) => t.id == id ? t.toggle() : t).toList();
    }
    notifyListeners();
  }

  void setFilter(TaskFilter f) {
    _filter = f;
    notifyListeners();
  }
}
