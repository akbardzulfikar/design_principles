import '../../features/tasks/domain/task.dart';

abstract class TaskFilter {
  List<Task> apply(List<Task> input);
}

class AllFilter implements TaskFilter {
  @override
  List<Task> apply(List<Task> input) => input;
}

class ActiveFilter implements TaskFilter {
  @override
  List<Task> apply(List<Task> input) => input.where((t) => !t.isDone).toList();
}

class DoneFilter implements TaskFilter {
  @override
  List<Task> apply(List<Task> input) => input.where((t) => t.isDone).toList();
}
