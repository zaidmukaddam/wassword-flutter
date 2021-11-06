import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wassword/styles/my_colors.dart' as mColors;
import 'package:wassword/ui/about_row.dart';

class AboutPage extends StatelessWidget {
  //Open the browser with the url provided
  void _launchURL(String urlToLaunch) async {
    if (await canLaunch(urlToLaunch)) {
      await launch(urlToLaunch);
    } else {
      throw 'Could not launch $urlToLaunch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mColors.backgroundView, // status bar color
        brightness: Brightness.dark, // status ba
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text(
          "About",
          style: GoogleFonts.roboto(
            color: mColors.colorTextLight,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Text(
                  "DEVELOPER",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: mColors.colorTextLight),
                ),
              ),
              AboutRow(
                icon: Icons.language,
                title: "Zaidmukaddam.me",
                subtitle: "Website",
                callback: () {
                  _launchURL("https://zaidmukaddam.me/");
                },
              ),
              AboutRow(
                icon: Icons.code,
                title: "@zaidmukaddam",
                subtitle: "Github",
                callback: () {
                  _launchURL("https://github.com/zaidmukaddam/");
                },
              ),
              AboutRow(
                icon: Icons.campaign,
                title: "@zaidmukaddam.c",
                subtitle: "Instagram",
                callback: () {
                  _launchURL("https://instagram.com/zaidmukaddam.c");
                },
              ),
              AboutRow(
                icon: Icons.business,
                title: "zaid-mukaddam",
                subtitle: "Linkedin",
                callback: () {
                  _launchURL(
                      "https://www.linkedin.com/in/zaid-mukaddam-26b155202/");
                },
              ),
            ],
          ),
          //An open list of apps built with Flutter
        ],
      ),
    );
  }
}
