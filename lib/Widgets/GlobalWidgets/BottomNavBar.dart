import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/About.dart';
import 'package:flutter_app/Screens/Impressum.dart';
import 'package:flutter_app/Screens/PrivacyPolicy.dart';
import 'package:flutter_app/Screens/Termsandconditions.dart';
import 'package:flutter_app/Widgets/GlobalWidgets/ToTheTopButton.dart';
import 'SelectionButton.dart';
import 'package:flutter_app/Screens/Kontakt.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {

  BottomBar({required this.child});

  Widget child = SizedBox();


  launchInstagram() {
    var url = 'https://www.instagram.com/charlottelob/?hl=de';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 100,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SelectionButton(name: "Kontakt", child: SizedBox(), onTap: (){ Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Kontakt(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );}),
              SelectionButton(name: "Terms & Conditions", onTap: (){Navigator.push(
                  context,
                  PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Termsandconditions(),
                transitionDuration: Duration(seconds: 0),
                ),);}, child: SizedBox(),),
              SelectionButton(name: "Impressum", onTap: (){Navigator.push(
                  context,
                  PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Impressum(),
                transitionDuration: Duration(seconds: 0),
                ),);},child: SizedBox(),),

              SelectionButton(name: "Instagram", onTap: () => {launchInstagram()},child: SizedBox(),),
              SelectionButton(name: "About", child: SizedBox(), onTap: (){Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => About(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );},),
              child,
            ],),
          ],
        ),
      ),
    );
  }
}
