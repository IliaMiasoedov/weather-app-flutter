import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weatherapp/src/features/presentation/screens/HomeScreen.dart';
import 'package:weatherapp/src/res/Strings.dart';
import 'package:weatherapp/src/res/StringsDelegate.dart';
import 'package:weatherapp/src/res/Themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          Strings.of(context).applicationName,
      localizationsDelegates: [
        const StringsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: locales,
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
