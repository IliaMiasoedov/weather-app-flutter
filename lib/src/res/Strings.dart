import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/error/failures.dart';
import 'package:weatherapp/src/features/presentation/bloc/State.dart';
import 'package:weatherapp/src/res/En.dart';
import 'package:weatherapp/src/res/Ru.dart';

const enLocaleLabel = 'en';
const ruLocaleLabel = 'ru';
final localeCodes = [enLocaleLabel, ruLocaleLabel];
final locales = [
  const Locale(enLocaleLabel, ''),
  const Locale(ruLocaleLabel, ''),
];
final Map<String, Map<String, String>> localizedValues = {
  enLocaleLabel: enMap,
  ruLocaleLabel: ruMap
};

class Strings {
  //Api key
  static const API_KEY = '0650ece01902c3f55a88e8fcb99a5c2d';
  static const BASE_URL = 'http://api.weatherstack.com/';

  //city queries
  static const saintPetersburgQuery = 'Saint-Petersburg';
  static const moscowQuery = 'Moscow';
  static const newYorkQuery = 'New York';
  static const kharkovQuery = 'Kharkov,ua';
  static const celsiusMark = '°C';

  final Locale locale;

  Strings(this.locale);

  static Strings of(BuildContext context) => Localizations.of(context, Strings);

  String get applicationName {
    return localizedValues[locale.languageCode]['applicationName'];
  }

  String get homePageTitle {
    return localizedValues[locale.languageCode]['homePageTitle'];
  }

  String get errorServer {
    return localizedValues[locale.languageCode]['errorServer'];
  }

  String get errorConnection {
    return localizedValues[locale.languageCode]['errorConnection'];
  }

  static String mapErrorToString(BuildContext context, Error error) {
    var message;
    if (error.failure is ConnectionError) {
      message = Strings.of(context).errorConnection;
    } else {
      message = Strings.of(context).errorServer;
    }
    return message;
  }
}

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
