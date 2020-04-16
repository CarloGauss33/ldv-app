import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/utils/cursoBtn.dart';
import 'package:LoDamosVuelta/utils/cloud.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  List<Widget> listaElems;
  void getData() async {
    var data = await fetchData("");
    listaElems = createBoxes(data);
    
  }


  @override
  void initState() {
    getData();
    super.initState();
  }

  List<Widget> displayElems(){return listaElems;}
  
  
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
          ...displayElems()
          
          ],
        ),
      ),
    ));
  }
}