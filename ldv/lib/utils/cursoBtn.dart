import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/screens/materiales.dart';
class CourseBtn extends StatelessWidget {
  String text;
  Color color;
  String id;

  CourseBtn(String text, Color color, String id) {
    this.text = text;
    this.color = color;
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(this.text),
      ),
      onPressed: () {
      Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MaterialScreen(this.id)),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
