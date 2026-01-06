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
      home: IspPage(),
    );
  }
}

/// ===============================
/// ISP — INTERFACES KECIL
/// ===============================

abstract class TapAction {
  void onTap();
}

abstract class LongPressAction {
  void onLongPress();
}

abstract class SwipeAction {
  void onSwipe();
}

/// ===============================
/// IMPLEMENTATION — HANYA TAP
/// ===============================
class IconTapAction implements TapAction {
  final BuildContext context;

  IconTapAction(this.context);

  @override
  void onTap() {
    debugPrint("Icon tapped");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Icon tapped!")),
    );
  }
}

/// ===============================
/// WIDGET — TERGANTUNG KE YANG DIPAKAI SAJA
/// ===============================
class IconButtonTile extends StatelessWidget {
  final TapAction tapAction;

  const IconButtonTile({
    super.key,
    required this.tapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapAction.onTap,
      child: const ListTile(
        leading: Icon(Icons.star),
        title: Text("Icon Button"),
      ),
    );
  }
}

/// ===============================
/// PAGE
/// ===============================
class IspPage extends StatelessWidget {
  const IspPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ISP Example"),
      ),
      body: Center(
        child: IconButtonTile(
          tapAction: IconTapAction(context),
        ),
      ),
    );
  }
}
