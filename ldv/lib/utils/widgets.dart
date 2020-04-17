import 'cloud.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'cursoBtn.dart';

Future<List<Widget>> createBoxes(String url) async {
  var data = await fetchData(url);

  if (data.containsKey("error")) {
    return [
      SizedBox(
        height: 30,
      ),
      Center(
        child: Container(
          child: Text(
            "Algo salio mal desde nuestro lado \nIntenta en unos minutos",
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
  } else {
    List<Widget> lista = new List();
    List<String> keys = new List();
    List<List> textList = new List();
    data.forEach((k, v) {
      for (int i = 0; i < v.length; i++) {
        var key = v[i].values.toList()[0]["id"];
        keys.add(key);
      }
    });
    data.forEach((k, v) {
      for (int i = 0; i < keys.length; i++) {
        var key = keys[i];
        textList.add([v[i][key]["name"], v[i][key]["id"]]);
      }
    });

    textList.sort((a, b) => a[0].compareTo(b[0]));

    textList.forEach((f) {
      lista.add(SizedBox(
        height: 10,
      ));
      lista.add(CourseBtn(f[0], Colors.blue, f[1]));
    });

    return lista;
  }
}
