import '../domain/task.dart';
import '../domain/task_repository.dart';

class FakeTaskRepository implements TaskRepository {
  @override
  Future<List<Task>> fetchTasks() async {
    return [
      const Task(id: '101', title: 'Fake Task 1'),
      const Task(id: '102', title: 'Fake Task 2', isDone: true),
    ];
  }

  @override
  Future<Task> toggle(String id) async {
    return Task(id: id, title: 'Fake Updated $id', isDone: true);
  }
}
