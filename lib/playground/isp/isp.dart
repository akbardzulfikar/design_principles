import 'package:flutter/material.dart';

// ✅ Pecah jadi kontrak kecil sesuai kebutuhan
abstract class TapAction {
  void onTap();
}

abstract class LongPressAction {
  void onLongPress();
}

abstract class SwipeAction {
  void onSwipe();
}

// Widget cukup minta kontrak yang relevan (granular)
class IconButtonTileIsp extends StatelessWidget {
  final TapAction tap; // ✅ hanya Tap yang wajib
  final LongPressAction? longPress; // opsional
  final SwipeAction? swipe; // opsional

  const IconButtonTileIsp({
    super.key,
    required this.tap,
    this.longPress,
    this.swipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap.onTap,
      onLongPress: longPress?.onLongPress, // aman kalau null
      onPanUpdate: (_) => swipe?.onSwipe(), // aman kalau null
      child: const ListTile(leading: Icon(Icons.star), title: Text("Icon")),
    );
  }
}

// Implementor hanya ambil yang dibutuhkan
class MyTapActionIsp implements TapAction {
  final BuildContext context;
  
  MyTapActionIsp(this.context);
  
  @override
  void onTap() {
    debugPrint("Icon tapped");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Icon tapped!")),
    );
  }
}

class MyLongPressActionIsp implements LongPressAction {
  final BuildContext context;
  
  MyLongPressActionIsp(this.context);
  
  @override
  void onLongPress() {
    debugPrint("Icon long pressed");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Icon long pressed!")),
    );
  }
}

class MySwipeActionIsp implements SwipeAction {
  final BuildContext context;
  
  MySwipeActionIsp(this.context);
  
  @override
  void onSwipe() {
    debugPrint("Icon swiped");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Icon swiped!")),
    );
  }
}