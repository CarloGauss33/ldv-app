import 'package:LoDamosVuelta/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cursoBtn.dart';
import 'package:LoDamosVuelta/utils/cloud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/widgets.dart';

class MaterialScreen extends StatefulWidget {
  static const String id = 'materialScreen';

  String route;
  MaterialScreen(String route){
    this.route = route;
  }

  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Widget>> display() async {
    List<Widget> lista = await createBoxes(widget.route);
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          title: Text("Lo Damos Vuelta"),
          backgroundColor: Colors.orange,
          centerTitle: true,
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
