import 'package:LoDamosVuelta/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cursoBtn.dart';
import 'package:LoDamosVuelta/utils/cloud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/widgets.dart';
import 'materiales.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MaterialScreen("root")),
                  );
                },
                child: Text("AAAAAAa")),
          ),
        ),
      ),
    );
  }
}
