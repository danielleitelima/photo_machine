import 'package:flutter/material.dart';
import 'package:photo_machine/core/constant/static_text.dart';
import 'package:photo_machine/core/exception/route_exception.dart';
import 'package:photo_machine/presentation/screen/main_screen.dart';


class AppRouter {
  static const String main = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            title: StaticText.mainScreenTitle,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
