
import 'package:building_material_user/change_notifiers/bottom_nav_change_notifier.dart';
import 'package:building_material_user/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/products_page.dart';
import '../ui/single_product_page.dart';

class Routes {
  static const homePage = '/';
  static const productsPage = '/products';
  static const singleProductPage = '/products/product';
}

class RouteGenerator {

  static Widget _getPage(String? name, Object? arguments) {
    switch (name) {
      case Routes.homePage:
        return ChangeNotifierProvider(
            create: (context) => BottomNavViewModel(),
            child: const HomePage(),
        );
      case Routes.productsPage:
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context)=>CounterViewModel()),
        ], child: const ProductsPage());

      case Routes.singleProductPage:
        return const SingleProductPage();
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