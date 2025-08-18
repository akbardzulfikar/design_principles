import 'task.dart';

abstract class WriteTasks {
  Future<Task> toggle(String id);
}
