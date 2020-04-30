import 'package:flutter/material.dart';
import 'package:LoDamosVuelta/screens/materiales.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseBtn extends StatelessWidget {
  String text;
  Color color;
  String id;
  String webViewLink;

  CourseBtn(String text, Color color, String id, String webViewLink) {
    this.text = text;
    this.color = color;
    this.id = id;
    this.webViewLink = webViewLink;

    if (!(this.webViewLink.contains("folder"))) {
      if (this.text.contains(".pdf")) {
        this.text = this.text.replaceAll(".pdf", "");
        this.color = Colors.red[200];
      }
    } else if (this.text.contains(".doc")) {
      this.text = this.text.replaceAll(".doc", "");
      this.color = Colors.red[300];
    }

    else if (this.text.contains(".mp4")) {
      print(this.text);
      this.text = this.text.replaceAll(".mp4", "");
      this.color = Colors.deepOrange;
    }
  }

  Future<void> _launchInBrowser() async {
    if (await canLaunch(this.webViewLink)) {
      await launch(
        this.webViewLink,
        forceWebView: false,
        forceSafariVC: false,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $this.webViewLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          this.text,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        )),
      ),
      onPressed: () {
        if (this.webViewLink.contains("folder")) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MaterialScreen(this.id)),
          );
        } else {
          _launchInBrowser();
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
