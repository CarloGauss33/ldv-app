import 'package:flutter/material.dart';

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
        height: 40,
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(this.text),
      ),
      onPressed: () {
        Navigator.pushNamed(context, "material_screen", arguments: this.id);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}


List<Widget> createBoxes(data){

  List<Widget> lista = new List();
  List<String> keys = new List();
  List<List> textList = new List();
  data.forEach((k,v){
    for(int i = 0; i<v.length; i++){
      var key = v[i].values.toList()[0]["id"];    
      keys.add(key);
  }
  });
  data.forEach((k,v){
    for (int i=0; i < keys.length; i++){
      var list = v[i];
      var key = keys[i];
      textList.add([v[i][key]["name"], v[i][key]["id"]]);}
  }
  );


  textList.sort((a, b) => a[0].compareTo(b[0]));

  textList.forEach((f){
    lista.add(CourseBtn(f[0], Colors.blue, f[1]));
  });

  return lista;
}