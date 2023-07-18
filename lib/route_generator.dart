import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mediaprobe/main.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:mediaprobe/widget/detail_page/detail_page.dart';
import 'package:mediaprobe/widget/error_page.dart';

class RouteGenerator {
  static Route<dynamic>? createRoute(
      Widget selectedWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => selectedWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => selectedWidget,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => selectedWidget,
      );
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return createRoute(const MyApp(), settings);
      case '/detail':
        Results newsResult = settings.arguments as Results;
        return createRoute( DetailPage(newsResult: newsResult ), settings);

      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
