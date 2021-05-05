import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_developer_flutter/src/pages/home.dart';
import 'package:test_developer_flutter/src/pages/splashScreen.dart';
import 'package:test_developer_flutter/src/provider/dataProvaiders.dart';

/*
 * definiendo rutas que se usaran en la app
 */
var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
  "/splash": (BuildContext context) => new SplashScreen(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => DataProvaider(),
      child: MaterialApp(
        title: "Prueba Técnica Desarrollador Frontend-Flutter ",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        routes: routes,
      ),
    );
  }
}
