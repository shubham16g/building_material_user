
import 'package:building_material_user/ui/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const homePage = '/';
  static const productsPage = '/products';
}

class RouteGenerator {

  static Widget _getPage(String? name, Object? arguments) {
    switch (name) {
      case Routes.homePage:
        return const HomePage();
      case Routes.productsPage:
        return const ProductsPage();
      default:
        return const HomePage();
    }
  }

  static Route<dynamic>? build(RouteSettings? settings) {
    if (settings == null) return null;
    Widget page = _getPage(settings.name, settings.arguments);
    return MaterialPageRoute(
        builder: (buildContext) => page, settings: settings);
  }
}