import 'package:flutter/material.dart';

class AppNavigation {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? args,
  }) {
    return _navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  static Future<dynamic> pushAndRemoveUntil(Widget page) {
    return _navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page), (route) => false);
  }

  static Future<dynamic> push(Widget page) => _navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static Future<dynamic> pushReplacement(Widget page) =>
      _navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  static void pop( {Object? v}) {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!.pop(v);
    }
  }

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
