import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weatherapp/src/res/Strings.dart';

final localeCodes = ['en', 'ru'];
final locales = [
  const Locale('en', ''),
  const Locale('ru', ''),
];

class StringsDelegate extends LocalizationsDelegate<Strings> {
  const StringsDelegate();

  @override
  bool isSupported(Locale locale) => localeCodes.contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(Strings(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => true;
}
