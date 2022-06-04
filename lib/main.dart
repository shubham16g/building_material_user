import 'package:building_material_user/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building Material App',
      onGenerateRoute: RouteGenerator.build,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        splashFactory: InkRipple.splashFactory,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      initialRoute: "/",
    );
  }

}
