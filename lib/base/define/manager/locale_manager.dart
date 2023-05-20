import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class AppLocaleManager {
  static final AppLocaleManager _instance = AppLocaleManager._internal();

  factory AppLocaleManager() => _instance;

  AppLocaleManager._internal();

  static BehaviorSubject<Locale>? appCurrentLocale;

  static init() {
    appCurrentLocale = BehaviorSubject();
  }
}
