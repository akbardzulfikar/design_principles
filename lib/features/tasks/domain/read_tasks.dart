import 'task.dart';

abstract class ReadTasks {
  Future<List<Task>> fetchTasks();
}
