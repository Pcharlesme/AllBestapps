import 'package:flutter/material.dart';
import 'package:testappbc/const/strings.dart';
import 'package:testappbc/main/homescreen.dart';
import 'package:testappbc/main/splash.dart';
import 'package:testappbc/views/day1/appscreen1.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/homescreen";
  static const String day1Route = "/Day1screen";
}

class RoutesGenarator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case Routes.homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case Routes.day1Route:
        return MaterialPageRoute(builder: ((context) => const DayOneView()));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRoute),
            ),
            body: const Center(child: Text(AppStrings.noRoute)),
          )),
    );
  }
}
