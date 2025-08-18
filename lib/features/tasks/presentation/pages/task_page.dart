import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../di/locator.dart';
// import '../../domain/task_repository.dart';
import '../state/task_controller.dart';
import '../widgets/task_list.dart';
import '../widgets/empty_state.dart';
import '../../../../core/filters/task_filter.dart';
import '../../domain/read_tasks.dart';
import '../../domain/write_tasks.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => TaskController(
            reader: sl<ReadTasks>(),
            writer: sl.isRegistered<WriteTasks>() ? sl<WriteTasks>() : null,
          )..load(),
      child: Builder(
        builder: (context) {
          final color = Theme.of(context).colorScheme;
          return Scaffold(
            appBar: AppBar(
              title: const Text('TaskLite'),
              actions: [
                PopupMenuButton<DataSource>(
                  tooltip: 'Switch Data Source',
                  onSelected: (source) async {
                    await setupDI(source);
                    // Rebuild with new binding
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const TaskPage()),
                    );
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          source == DataSource.remote
                              ? 'Switched to Remote'
                              : 'Switched to Local',
                        ),
                      ),
                    );
                  },
                  itemBuilder:
                      (_) => const [
                        PopupMenuItem(
                          value: DataSource.local,
                          child: Text('Local Source'),
                        ),
                        PopupMenuItem(
                          value: DataSource.remote,
                          child: Text('Remote Source'),
                        ),
                      ],
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Consumer<TaskController>(
                    builder: (context, c, _) {
                      return Wrap(
                        spacing: 8,
                        children: [
                          FilterChip(
                            label: const Text('All'),
                            selected: c.filter is AllFilter,
                            onSelected: (_) => c.setFilter(AllFilter()),
                          ),
                          FilterChip(
                            label: const Text('Active'),
                            selected: c.filter is ActiveFilter,
                            onSelected: (_) => c.setFilter(ActiveFilter()),
                          ),
                          FilterChip(
                            label: const Text('Done'),
                            selected: c.filter is DoneFilter,
                            onSelected: (_) => c.setFilter(DoneFilter()),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            body: Consumer<TaskController>(
              builder: (_, c, __) {
                if (c.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Pull-to-refresh when there are items
                if (c.tasks.isNotEmpty) {
                  return RefreshIndicator(
                    onRefresh: c.load,
                    child: TaskList(tasks: c.tasks, onToggle: c.toggle),
                  );
                }
                // Empty state still scrolls to enable pull-to-refresh
                return RefreshIndicator(
                  onRefresh: c.load,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [SizedBox(height: 160), EmptyState()],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
