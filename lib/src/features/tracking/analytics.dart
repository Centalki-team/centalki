import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import 'tracking.dart';

typedef AnalyticsLogger<T> = Function(T? logger);

Analytics? _inst;

class Analytics {
  const Analytics.init({
    Ecommerce? ecommerce,
    List<Object> custom = const [],
    Marker? marker,
  })  : _ecommerce = ecommerce,
        _custom = custom,
        _marker = marker ?? const Marker();

  factory Analytics({
    Ecommerce? ecommerce,
    List<Object> custom = const [],
    Marker? marker,
  }) {
    _inst = Analytics.init(
      ecommerce: ecommerce,
      custom: custom,
      marker: marker,
    );
    return _inst!;
  }

  static Analytics? get inst => _inst;

  static const paramLimit = 100;

  static String? limitParam(String? param) {
    if (param == null) return null;
    if (param.length > paramLimit) {
      return param.substring(0, paramLimit);
    }
    return param;
  }

  final Ecommerce? _ecommerce;
  final Marker _marker;
  final List<Object> _custom;

  void logZoned<T1>(T1? logger, AnalyticsLogger<T1> func) async {
    runZonedGuarded(() {
      Log.debug('${DateTime.now()}');
      func(logger);
    }, Log.error);
  }

  void custom<T1>(AnalyticsLogger<T1> func) {
    try {
      final logger =
          _custom.firstWhereOrNull((element) => element is T1) as T1?;
      logZoned<T1>(logger, func);
    } catch (e) {
      Log.error(e);
    }
  }

  void ecommerce(AnalyticsLogger<Ecommerce> func) {
    logZoned<Ecommerce>(_ecommerce, func);
  }

  void mark(AnalyticsLogger<Marker> func) {
    logZoned<Marker>(_marker, func);
  }
}
