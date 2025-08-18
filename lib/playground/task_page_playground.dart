import 'package:flutter/material.dart';
import '../features/tasks/domain/task.dart';

class TaskPagePlayground extends StatelessWidget {
  const TaskPagePlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      Task(id: '1', title: 'Baca SOLID'),
      Task(id: '2', title: 'Baca SLD'),
    ];
    return Scaffold(
      body: ListView(
        children:
            tasks
                .map(
                  (t) => CheckboxListTile(
                    value: t.isDone,
                    onChanged: (_) {},
                    title: Text(t.title),
                  ),
                )
                .toList(),
      ),
    );
  }
}
