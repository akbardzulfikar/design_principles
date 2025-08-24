import 'package:flutter/material.dart';
import 'features/tasks/presentation/pages/task_page.dart';
import 'playground/task_page_main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskLite',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF366CF6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const TaskPage(),
      home: const TaskPageScaffold(),
    );
  }
}
