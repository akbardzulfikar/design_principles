import 'package:flutter/material.dart';
import '../../ocp/ocp_anti_example.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isDone;

  const TaskItem({super.key, required this.title, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isDone,
      onChanged: (_) {},
      title: Text(title),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<TaskItem> items;

  const TaskList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(children: items);
  }
}

class TaskPageSrp extends StatelessWidget {
  const TaskPageSrp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskList(
      items: [
        TaskItem(title: "Belajar SRP", isDone: false),
        TaskItem(title: "Ngoding Flutter", isDone: true),
      ],
    );
  }
}

