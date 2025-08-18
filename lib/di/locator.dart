import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/tasks/data/in_memory_task_repository.dart';
import '../features/tasks/data/remote_task_repository.dart';
import '../features/tasks/domain/read_tasks.dart';
import '../features/tasks/domain/write_tasks.dart';

final sl = GetIt.instance;

enum DataSource { local, remote }

Future<void> setupDI(DataSource source) async {
  await sl.reset();

  switch (source) {
    case DataSource.remote:
      sl.registerLazySingleton<ReadTasks>(
        () => RemoteTaskRepository(http.Client()),
      );
      // No WriteTasks binding for remote; it's read-only by design
      break;

    case DataSource.local:
    default:
      final local = InMemoryTaskRepository();
      sl.registerLazySingleton<ReadTasks>(() => local);
      sl.registerLazySingleton<WriteTasks>(() => local);
  }

  assert(sl.isRegistered<ReadTasks>(), 'ReadTasks failed to register');
}
