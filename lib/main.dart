import 'package:flutter/material.dart';
import 'app.dart';
import 'di/locator.dart';
// import 'playground/dependency_injection/di_anti_example.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI(DataSource.local); // start with local
  // mainDi();
  runApp(const MyApp());
}
