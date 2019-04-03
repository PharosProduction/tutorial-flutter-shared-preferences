import 'dart:async';

import 'package:tutorial_flutter_shared_prefs/prefs/preferences_base.dart';

class Prefs {
  static Future<String> get tutorialString => PreferencesHelper.getString(Const.TUTORIAL_STRING);

  static Future setTutorialString(String value) => PreferencesHelper.setString(Const.TUTORIAL_STRING, value);

  static Future<bool> get authenticated => PreferencesHelper.getBool(Const.AUTHENTICATED);

  static Future setAuthenticated(bool value) => PreferencesHelper.setBool(Const.AUTHENTICATED, value);

  static Future<String> get passcode => PreferencesHelper.getString(Const.PASSODE);

  static Future setPasscode(String value) => PreferencesHelper.setString(Const.PASSODE, value);

  static Future<void> clear() async {
    await Future.wait(<Future>[
      setAuthenticated(false),
      setTutorialString(''),
      setPasscode(''),
    ]);
  }
}

class Const {
  static const String TUTORIAL_STRING = 'TUTORIAL_STRING';

  // Default preferences
  static const String AUTHENTICATED = 'AUTHENTICATED';
  static const String PASSODE = 'PASSCODE';
  static const String FINGERPRINT_ENABLED = 'FINGERPRINT_ENABLED';
}
