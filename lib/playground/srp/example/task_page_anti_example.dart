import 'package:flutter/material.dart';

class TaskPageSrpAnti extends StatelessWidget {
  const TaskPageSrpAnti({super.key});

  @override
  Widget build(BuildContext context) {
    // 🚨 semua logic list + item ada di sini
    return ListView(
      children: [
        CheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: Text("Belajar SRP"),
        ),
        CheckboxListTile(
          value: false,
          onChanged: (_) {},
          title: Text("Ngoding flutter"),
        ),
      ],
    );
  }
}
