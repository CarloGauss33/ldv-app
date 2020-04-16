import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(LDV());

class LDV extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Color(0xFFFF8A38),
    accentColor: Color(0xFF16C6B9),

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      )),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),

      },
    );
  }
}