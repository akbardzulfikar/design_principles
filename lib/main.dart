import 'package:flutter/material.dart';
import 'app.dart';
import 'di/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI(DataSource.local); // start with local
  runApp(const MyApp());
}
