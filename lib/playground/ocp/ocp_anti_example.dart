import 'package:flutter/material.dart';

class TaskItemOcpAnti extends StatelessWidget {
  final String type; // "done" atau "pending"
  final String title;

  const TaskItemOcpAnti({super.key, required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    if (type == "done") {
      return ListTile(
        leading: Icon(Icons.check, color: Colors.green),
        title: Text(title),
      );
    } else if (type == "pending") {
      return ListTile(
        leading: Icon(Icons.hourglass_empty, color: Colors.orange),
        title: Text(title),
      );
    } else {
      return ListTile(title: Text(title));
    }
  }
}


// example OCP
class TaskPageOcpAnti extends StatelessWidget {
  const TaskPageOcpAnti({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskItemOcpAnti(type: "done", title: "OCP"),
        TaskItemOcpAnti(type: "pending", title: "OCP")
      ],
    );
  }
}