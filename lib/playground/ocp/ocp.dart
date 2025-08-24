import 'package:flutter/material.dart';

abstract class TaskStyle {
  Icon get icon;
}

class DoneStyle implements TaskStyle {
  @override
  Icon get icon => Icon(Icons.check, color: Colors.green);
}

class PendingStyle implements TaskStyle {
  @override
  Icon get icon => Icon(Icons.hourglass_empty, color: Colors.orange);
}

class DefaultStyle implements TaskStyle {
  @override
  Icon get icon => Icon(Icons.note, color: Colors.grey);
}

class TaskItem extends StatelessWidget {
  final String title;
  final TaskStyle style;

  const TaskItem({super.key, required this.title, required this.style});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: style.icon, title: Text(title));
  }
}

class TaskListOcp extends StatelessWidget {
  const TaskListOcp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TaskItem(title: 'Task 1', style: PendingStyle()),
      TaskItem(title: 'Task 2', style: DoneStyle()),
      TaskItem(title: 'Task 3', style: DefaultStyle()),
      TaskItem(title: 'Task 4', style: PendingStyle()),
      TaskItem(title: 'Task 5', style: DoneStyle()),
      ],
    );
  }
}
