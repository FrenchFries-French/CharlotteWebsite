import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TwoCards extends StatefulWidget {
  TwoCards({
    this.firstHeightMultiplicator = 0.45,
    this.secondHeightMultiplicator = 0.6,
    required this.firstGalerieName,
    required this.secondImageString,
    required this.firstImageString,
    required this.secondGalerieName,
  });

  double firstHeightMultiplicator;
  double secondHeightMultiplicator;
  String firstGalerieName;
  String secondImageString;
  String firstImageString;
  String secondGalerieName;

  @override
  _TwoCardsState createState() => _TwoCardsState();
}

class _TwoCardsState extends State<TwoCards> {
  bool _isHoveredfirst = false;
  bool _isHoveredsecond = false;
  double _opacityfirst = 0;
  double _opacitysecond = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: GestureDetector( //War vorher ein MouseRegion
            /*onHover: (event) {
              _isHoveredfirst = true;
              setState(() {
                if (_isHoveredfirst == true) {
                  _opacityfirst = 1;
                } else {
                  _opacityfirst = 0;
                }
              });
            },
            onEnter: (event) {
              _isHoveredfirst = true;
              setState(() {
                if (_isHoveredfirst == true) {
                  _opacityfirst = 1;
                } else {
                  _opacityfirst = 0;
                }
              });
            },
            onExit: (event) {
              _isHoveredfirst = false;
              setState(() {
                if (_isHoveredfirst == true) {
                  _opacityfirst = 1;
                } else {
                  _opacityfirst = 0;
                }
              });
            },*/
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.asset(
                        widget.firstImageString,
                        height: 25.h,
                      ),
                      /*Container(
                        padding: EdgeInsets.all(1.w),
                        child: Opacity(
                          opacity: _opacityfirst,
                          child: Container(
                            color: Colors.black26,
                            child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Galerie " + widget.firstGalerieName,
                                      style: TextStyle(
                                          fontSize: 3.5.w,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "By Charlotte Lobry",
                                      style: TextStyle(
                                          fontSize: 2.w,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "See galerie",
                                      style: TextStyle(
                                          fontSize: 2.w,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ),
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
                    " Galerie " + widget.firstGalerieName,
                    style: TextStyle(fontSize: 1.1.h),
                  ),
                ),
                Container(
                  child: Text(
                      "See galery",
                      style: TextStyle(fontSize: 1.1.h, color: Colors.grey[600])),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          // width: 10.w,
          width: 10.w,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: Column(
            children: [
              GestureDetector( //War vorher ein MouseRegion
                /*onHover: (event) {
                  _isHoveredsecond = true;
                  setState(() {
                    if (_isHoveredsecond == true) {
                      _opacitysecond = 1;
                    } else {
                      _opacitysecond = 0;
                    }
                  });
                },
                onEnter: (event) {
                  _isHoveredsecond = true;
                  setState(() {
                    if (_isHoveredsecond == true) {
                      _opacitysecond = 1;
                    } else {
                      _opacitysecond = 0;
                    }
                  });
                },
                onExit: (event) {
                  _isHoveredsecond = false;
                  setState(() {
                    if (_isHoveredsecond == true) {
                      _opacitysecond = 1;
                    } else {
                      _opacitysecond = 0;
                    }
                  });
                },*/
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image.asset(
                            widget.secondImageString,
                            height: 30.h,
                          ),
                          /*Container(
                            padding: EdgeInsets.all(10),
                            child: Opacity(
                              opacity: _opacitysecond,
                              child: Container(
                                color: Colors.black26,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Galerie " + widget.secondGalerieName,
                                          style: TextStyle(
                                              fontSize: 3.5.w,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "By Charlotte Lobry",
                                          style: TextStyle(
                                              fontSize: 2.w,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "See galerie",
                                          style: TextStyle(
                                              fontSize: 2.w,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
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
                        " Galerie " + widget.secondGalerieName,
                        style: TextStyle(fontSize: 1.1.h),
                      ),
                    ),
                    Container(
                      child: Text(
                          "See galery",
                          style: TextStyle(fontSize: 1.1.h, color: Colors.grey[600])),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
