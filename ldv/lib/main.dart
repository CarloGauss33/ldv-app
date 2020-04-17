import 'package:LoDamosVuelta/screens/materiales.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(LDV());

class LDV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFFFF8A38),
          accentColor: Color(0xFF16C6B9),
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        MaterialScreen.id: (context) => MaterialScreen(""),
      },
    );
  }
}
