import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cloud.dart';

class CourseBtn extends StatelessWidget {
  String text;
  String route;
  Color color;

  CourseBtn(String text, String route, Color color) {
    this.text = text;
    this.route = route;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(this.text),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
