import 'package:flutter/material.dart';

class HomePageImage extends StatefulWidget {
  @override
  _HomePageImageState createState() => _HomePageImageState();
}

class _HomePageImageState extends State<HomePageImage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.75,
      width: screenSize.width * 0.5,
      child: Image.asset(
        'assets/images/reveuse2.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}
