import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ===============================
/// 1️⃣ STATE HOLDER (SUBJECT)
/// ===============================
class CounterController extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners(); // ✅ beri tahu observer
  }
}

/// ===============================
/// 2️⃣ UI (OBSERVER)
/// ===============================
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter (Observer)"),
      ),
      body: Center(
        child: Consumer<CounterController>(
          builder: (_, ctrl, __) {
            return Text(
              '${ctrl.value}',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: Consumer<CounterController>(
        builder: (_, ctrl, __) {
          return FloatingActionButton(
            onPressed: ctrl.increment,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

/// ===============================
/// 3️⃣ PROVIDER (WIRING)
/// ===============================
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterController(),
      child: const MaterialApp(
        home: CounterPage(),
      ),
    ),
  );
}
