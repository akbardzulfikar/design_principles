import 'package:flutter/material.dart';

/// Kontrak (parent) yang harus dipenuhi semua subclass
abstract class BaseButton {
  /// Kembalikan pesan saat diklik (supaya gampang ditampilkan di UI)
  String onClick();
}

/// Subclass yang valid
class IconButtonLSP implements BaseButton {
  @override
  String onClick() => "Icon button clicked!";
}

/// Subclass yang valid (tidak melempar error)
class DisabledButtonLSP implements BaseButton {
  @override
  String onClick() => "Nothing happens (disabled).";
}

/// Widget demo LSP
class LspButton extends StatelessWidget {
  const LspButton({super.key});

  void _testButton(BuildContext context, BaseButton btn) {
    final msg = btn.onClick(); // semua subclass aman dipanggil
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ElevatedButton(
          child: const Text("Icon Button"),
          onPressed: () => _testButton(context, IconButtonLSP()), // ✅ ok
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          child: const Text("Disabled Button"),
          onPressed: () => _testButton(context, DisabledButtonLSP()), // ✅ ok (tidak crash)
        ),
      ],
    );
  }
}