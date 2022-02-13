import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/About.dart';
import 'package:charletwebsite/Screens/Impressum.dart';
import 'package:charletwebsite/Screens/Termsandconditions.dart';
import 'SelectionButton.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.child});

  final Widget child;

  launchInstagram() {
    var url = 'https://www.instagram.com/charlottelob/?hl=de';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                  name: "Kontakt",
                  child: const SizedBox(),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const Kontakt(),
                        transitionDuration: const Duration(seconds: 0),
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
                          const Termsandconditions(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                child: const SizedBox(),
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
                          const Impressum(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                child: const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "Instagram",
                onTap: () => {launchInstagram()},
                child: const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SelectionButton(
                name: "About",
                child: const SizedBox(),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const About(),
                      transitionDuration: const Duration(seconds: 0),
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
