import 'package:flutter/material.dart';

import '../27_路由管理.dart';
import '../about.dart';
import '../detail.dart';
import '../error.dart';

class HYRouter {
  static final Map<String, WidgetBuilder> routes = {
    //命名路由
    HYHomePage.routerName: (ctx) => HYHomePage(),
    HYAboutPage.routerName: (ctx) => HYAboutPage()
  };
  static final String initialRoute = HYHomePage.routerName;

  static final RouteFactory generateRoute = (setting) {
    if (setting.name == HYDetailScreen.routername) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HYDetailScreen(setting.arguments as String);
          }
      );
    }
    return null;
  };
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return HYErrortPage();
        }
    );
  };
}