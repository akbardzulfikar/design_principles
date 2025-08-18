import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.inbox_outlined, size: 48),
        SizedBox(height: 8),
        Text('No tasks available', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
