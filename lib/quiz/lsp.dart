import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ===============================
/// APP
/// ===============================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LspButtonPage(),
    );
  }
}

/// ===============================
/// LSP — BASE CLASS (KONTRAK AMAN)
/// ===============================
abstract class BaseButton {
  /// Semua button HARUS bisa diklik
  /// dan hasilnya DIKEMBALIKAN,
  /// bukan throw error.
  String onClick();
}

/// ===============================
/// SUBCLASS 1 — NORMAL BUTTON
/// ===============================
class IconButtonLsp implements BaseButton {
  @override
  String onClick() {
    return "Icon button clicked!";
  }
}

/// ===============================
/// SUBCLASS 2 — DISABLED BUTTON (LSP AMAN)
/// ===============================
class DisabledButtonLsp implements BaseButton {
  @override
  String onClick() {
    return "Button is disabled";
  }
}

/// ===============================
/// UI (CALLER TIDAK PEDULI SUBCLASS)
/// ===============================
class LspButtonPage extends StatelessWidget {
  const LspButtonPage({super.key});

  void _testButton(BuildContext context, BaseButton button) {
    final message = button.onClick(); // 🔥 selalu aman
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LSP Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  _testButton(context, IconButtonLsp()),
              child: const Text("Icon Button"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  _testButton(context, DisabledButtonLsp()),
              child: const Text("Disabled Button"),
            ),
          ],
        ),
      ),
    );
  }
}
