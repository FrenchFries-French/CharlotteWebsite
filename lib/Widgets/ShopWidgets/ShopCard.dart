// import 'dart:html';

import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  ShopCard(
      {required this.imageString,
      required this.imageHeight,
      required this.onTap});

  String imageString;
  double imageHeight;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onTap,
                  child: Center(
                    child: Image.asset(
                      imageString,
                      height: screenSize.height * imageHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: onTap,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Photo  'Reveuse' - 25€",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Text("Verschiedene  Größen,   Mit  Rahmen  verfügbar",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ])),
        ],
      ),
    );
  }
}
