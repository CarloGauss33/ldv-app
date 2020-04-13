import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cursoBtn.dart';


class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Theme.of(context).accentColor
            ])),
        child: Column(
          children: <Widget>[
            // HEADER CONTAINER
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(200.0)),
                color: Theme.of(context).primaryColor,
              ),
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                    Text(
                      "Lo Damos Vuelta",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
            ),

            SizedBox(
              height: 40.0,
            ),

            CourseBtn("HOLAA",  "AA", Colors.red),

            
                        SizedBox(
              height: 15.0,
            ),
                        Container(
              height: 30,
              width: 150,
              color: Colors.green,
              child: FlatButton(
                child: Text("CURSOS"),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
                        Container(
              height: 30,
              width: 150,
              color: Colors.green,
              child: FlatButton(
                child: Text("CURSOS"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    ));
  }
}
