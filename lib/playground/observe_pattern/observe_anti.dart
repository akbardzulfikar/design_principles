import 'package:flutter/material.dart';
class CounterControllerAnti extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;          // 🚨 berubah, tapi tidak memberi tahu observer
    // notifyListeners();  <-- tidak dipanggil
  }
}

class CounterPageAnti extends StatelessWidget {
  const CounterPageAnti({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = CounterControllerAnti(); // 🚨 bikin instance sendiri (bukan dari Provider)

    return Scaffold(
      appBar: AppBar(title: const Text('Counter (Wrong)')),
      body: Center(child: Text('${ctrl.value}')),  // 🚨 tidak akan update
      floatingActionButton: FloatingActionButton(
        onPressed: ctrl.increment,                 // klik → value naik, UI tetap
        child: const Icon(Icons.add),
      ),
    );
  }
}