import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/features/presentation/screens/HomeScreen.dart';
import 'package:weatherapp/src/res/Strings.dart';
import 'package:weatherapp/src/res/Themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.applicationName,
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
