import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/About.dart';
import 'package:charletwebsite/Screens/Impressum.dart';
import 'package:charletwebsite/Screens/Termsandconditions.dart';
import 'SelectionButton.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  BottomBar({required this.child});

  final Widget child;

  launchInstagram() {
    var url = 'https://www.instagram.com/charlottelob/?hl=de';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                  name: "Kontakt",
                  child: SizedBox(),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Kontakt(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "Terms & Conditions",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          Termsandconditions(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "Impressum",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          Impressum(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "Instagram",
                onTap: () => {launchInstagram()},
                child: SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "About",
                child: SizedBox(),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => About(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
              ),
            ),
            child,
          ],
        ),
      ],
    );
  }
}
