import 'package:flutter/material.dart';
import 'package:weatherapp/src/App.dart';
import 'injectionContainer.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}