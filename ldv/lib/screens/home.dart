import 'package:LoDamosVuelta/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cursoBtn.dart';
import 'package:LoDamosVuelta/utils/cloud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSpiner = true;
  @override
  void initState() {
    super.initState();
  }

  Future<List<Widget>> display() async {
    List<Widget> lista = await createBoxes("root");
    _showSpiner = true;
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lo Damos Vuelta"),
          backgroundColor: Colors.orange,
        ),
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
          child: FutureBuilder(
            future: display(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: <Widget>[...snapshot.data],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
