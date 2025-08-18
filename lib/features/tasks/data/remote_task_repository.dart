import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/task.dart';
import '../domain/read_tasks.dart';

class RemoteTaskRepository implements ReadTasks {
  final http.Client _client;
  List<Task>? _cache; // still useful for UI

  RemoteTaskRepository(this._client);

  @override
  Future<List<Task>> fetchTasks() async {
    final res = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=10'),
    );
    if (res.statusCode != 200) {
      throw StateError('Network error ${res.statusCode}');
    }
    final List data = jsonDecode(res.body) as List;
    _cache = data
        .map((e) => Task(
              id: '${e['id']}',
              title: e['title'] as String,
              isDone: e['completed'] as bool,
            ))
        .toList();
    return List.unmodifiable(_cache!);
  }

  // No WriteTasks here by design → no throws, no partial impl.
}
