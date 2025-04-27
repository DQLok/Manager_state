import 'package:flutter/material.dart';
import 'package:manager_state/features/views/future/future_page.dart';
import 'package:manager_state/features/views/home/home_page.dart';
import 'package:manager_state/features/views/loading_data/loading_data_page.dart';
import 'package:manager_state/features/views/splash/splash_page.dart';

class RoutePaths {
  static const String splashRoute = "/";
  static const String future = "/future";
  static const String loadingData = "/loadingData";
  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePaths.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RoutePaths.future:
        return MaterialPageRoute(builder: (context) => const FuturePage());
      case RoutePaths.loadingData:
        return MaterialPageRoute(builder: (context) => const LoadingDataPage());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
