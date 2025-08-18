import '../task.dart';
import '../task_repository.dart';

class FetchTasks {
  final TaskRepository repository;
  FetchTasks(this.repository);

  Future<List<Task>> call() => repository.fetchTasks();
}
