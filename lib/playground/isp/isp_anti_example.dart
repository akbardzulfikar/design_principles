import 'package:flutter/material.dart';

// 🚨 Interface gemuk: semua implementor dipaksa punya 3 aksi
abstract class ButtonActions {
  void onTap();
  void onLongPress();
  void onSwipe();
}

// Hanya butuh tap → terpaksa "mengakali" 2 method lain
class IconOnlyActions implements ButtonActions {
  final BuildContext context;

  const IconOnlyActions(this.context);
  @override
  void onTap() {
    debugPrint("Icon tapped");
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Button tapped!")));
  }

  @override
  void onLongPress() {
    // ❌ no-op / kosong → bau desain (kode jalan tapi strukturnya salah)
  }

  @override
  void onSwipe() {
    // ❌ atau kadang ada yang throw → makin buruk (kena LSP juga)
    throw UnimplementedError();
  }
}

// Widget pakai kontrak yang terlalu besar
class IconButtonTileAnti extends StatelessWidget {
  final ButtonActions actions;
  const IconButtonTileAnti({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actions.onTap,
      onLongPress: actions.onLongPress, // dipaksa ada
      onPanUpdate: (_) => actions.onSwipe(), // dipaksa ada
      child: const ListTile(leading: Icon(Icons.star), title: Text("Icon")),
    );
  }
}
