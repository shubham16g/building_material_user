import 'package:building_material_user/network/service/api_service.dart';
import 'package:building_material_user/network/service/dev/DevApiService.dart';
import 'package:building_material_user/network/service/prod/ProdApiService.dart';
import 'package:building_material_user/routes/routes.dart';
import 'package:building_material_user/ui/ProductsPage.dart';
import 'package:building_material_user/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'network/dio_connect.dart';

void main() {
  // GestureBinding.instance.resamplingEnabled = true;
  // GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Building Material App',
      onGenerateRoute: RouteGenerator.build,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        splashFactory: InkRipple.splashFactory,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      initialRoute: "/",
    );
  }
}




//provider dependency injection using proxy provider

final List<SingleChildWidget> providers = [
  Provider.value(value: DioConnect()),
  // Provider.value(value: BottomNavViewModel()),
  // ChangeNotifierProvider(create: (context)=>CounterViewModel()),
  ProxyProvider<DioConnect, ApiService>(update: (context, dioConnect, old)=> DevApiService(dioConnect)),
];

