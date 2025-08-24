import 'package:flutter/material.dart';

abstract class BadBaseButton {
  void onClick();
}

class BadIconButtonLSP implements BadBaseButton {
  @override
  void onClick() {
    debugPrint("Icon button clicked!");
  }
}
class BadDisabledButtonLSP implements BadBaseButton {
  @override
  void onClick() {
    throw UnimplementedError("Disabled button can't be clicked");
  }
}

class LspButtonBad extends StatelessWidget {
  const LspButtonBad({super.key});

  void _testButton(BadBaseButton btn, BuildContext context) {
    btn.onClick(); 
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Button clicked successfully!")),
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ElevatedButton(
          child: const Text("Icon Button (OK)"),
          onPressed: () => _testButton(BadIconButtonLSP(), context), 
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          child: const Text("Disabled Button (Will Crash)"),
          onPressed: () => _testButton(BadDisabledButtonLSP(), context),
        ),
      ],
    );
  }
}