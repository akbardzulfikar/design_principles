import '../task.dart';
import '../task_repository.dart';

class ToggleTask {
  final TaskRepository repository;
  ToggleTask(this.repository);

  Future<Task> call(String id) => repository.toggle(id);
}
