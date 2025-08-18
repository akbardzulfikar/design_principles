import 'read_tasks.dart';
import 'write_tasks.dart';

abstract class TaskRepository implements ReadTasks, WriteTasks {}
