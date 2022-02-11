import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OneCard extends StatefulWidget {
  OneCard(
      {required this.imageString,
      required this.heightMultiplicator,
      required this.galerieName,
      required this.kuenstler});

  String imageString;
  double heightMultiplicator = 0.65;
  String galerieName;
  String kuenstler;

  @override
  _OneCardState createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  bool _isHovered = false;
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector( //Vorher war es Mouse Region
              onTap: () {print("Tapped");},
                /*onHover: (event) {
                  _isHovered = true;
                  setState(() {
                    if (_isHovered == true) {
                      _opacity = 1;
                    } else {
                      _opacity = 0;
                    }
                  });
                },
                onEnter: (event) {
                  _isHovered = true;
                  setState(() {
                    if (_isHovered == true) {
                      _opacity = 1;
                    } else {
                      _opacity = 0;
                    }
                  });
                },
                onExit: (event) {
                  _isHovered = false;
                  setState(() {
                    if (_isHovered == false) {
                      _opacity = 0;
                    } else {
                      _opacity = 1;
                    }
                  });
                },*/
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.asset(
                        widget.imageString,
                        height: 37.h,
                      ),
                      /*Container(
                            padding: EdgeInsets.all(10),
                            child: Opacity(
                              opacity: _opacity,
                              child:
                              Container(
                                color: Colors.black26,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Galerie " + widget.galerieName,
                                            style: TextStyle(fontSize: 3.5.w, fontWeight: FontWeight.bold,color: Colors.white),
                                          ),
                                          Text(
                                            "By " + widget.kuenstler,
                                            style: TextStyle(fontSize: 2.w, fontStyle: FontStyle.normal,color: Colors.white),
                                          ),
                                          Text(
                                            "See galerie",
                                            style: TextStyle(fontSize: 2.w, fontStyle: FontStyle.normal,color: Colors.white),
                                          ),
                                        ],
                                      )),),
                              ),
                          )*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  child: Text(
                   " Galerie " + widget.galerieName,
                    style: TextStyle(fontSize: 1.1.h),
                  ),
                ),
                Container(
                  child: Text(
                      "See galery",
                      style: TextStyle(fontSize: 1.1.h, color: Colors.grey[600])),
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }
}
