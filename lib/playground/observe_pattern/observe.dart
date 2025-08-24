import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ✅ Controller memberi notifikasi ke observer
class CounterController extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners(); // 🔔 beri tahu semua pendengar
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter (Observer)')),
      body: Center(
        child: Consumer<CounterController>(
          builder:
              (_, ctrl, __) =>
                  Text('${ctrl.value}', style: const TextStyle(fontSize: 32)),
        ),
      ),
      floatingActionButton: Consumer<CounterController>(
        builder:
            (_, ctrl, __) => FloatingActionButton(
              onPressed:
                  ctrl.increment, // klik → value naik → notify → UI rebuild
              child: const Icon(Icons.add),
            ),
      ),
    );
  }
}
