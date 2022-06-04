import 'package:building_material_user/routes/routes.dart';
import 'package:building_material_user/ui/home_page.dart';
import 'package:flutter/material.dart';
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
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        splashFactory: InkRipple.splashFactory,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: "/",
    );
  }

}
