import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/FotoPage.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/videoCard.dart';
import 'package:sizer/sizer.dart';

class TwoCards extends StatefulWidget {
  final List<dynamic>? links;
  final bool? showGalleryText;
  final QueryDocumentSnapshot<Map<String, dynamic>>? firbaseObject;
  const TwoCards({
    Key? key,
    this.firstHeightMultiplicator = 0.45,
    this.secondHeightMultiplicator = 0.6,
    required this.firstGalerieName,
    required this.secondImageString,
    required this.firstImageString,
    required this.secondGalerieName,
    this.showGalleryText,
    this.imageType,
    this.links,
    this.firbaseObject,
  }) : super(key: key);

  final double firstHeightMultiplicator;
  final double secondHeightMultiplicator;
  final String? imageType;
  final String firstGalerieName;
  final String secondImageString;
  final String firstImageString;
  final String secondGalerieName;

  @override
  _TwoCardsState createState() => _TwoCardsState();
}

class _TwoCardsState extends State<TwoCards> {
  // bool _isHoveredsecond = false;
  // double _opacityfirst = 0;
  // double _opacitysecond = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.96),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: screenSize.width > 440
                ? const BoxConstraints()
                : BoxConstraints(
                    maxWidth: screenSize.width * 0.47,
                  ),
            child: GestureDetector(
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        widget.links != null
                            ? VideoCard(
                                videoPlayerLink: widget.firstImageString,
                                thumbnailLink:
                                    widget.firbaseObject!.get("thumbnail"),
                              )
                            : InkWell(
                                onTap: () {
                                  log("message");
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.white,
                                    builder: (context) {
                                      return AlertDialog(
                                        elevation: 300,
                                        backgroundColor: Colors.white,
                                        contentPadding: EdgeInsets.zero,
                                        content: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SizedBox(
                                            width: screenSize.width * 0.92,
                                            height: screenSize.height * 0.92,
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    widget.firstImageString,

                                                width: screenSize.width * 2,
                                                height: screenSize.width < 480
                                                    ? screenSize.height * 1.8
                                                    : screenSize.height * 2.8,

                                                fit: BoxFit.contain,
                                                fadeInCurve: Curves.ease,
                                                fadeOutCurve: Curves.ease,
                                                placeholder:
                                                    (BuildContext context,
                                                            String url) =>
                                                        Container(
                                                  // width: 320,
                                                  height: 40.h,
                                                  // color: Colors.white,
                                                ),
                                                // imageRenderMethodForWeb: ImageR,
                                              ),
                                            ),
                                          ),
                                        ),
                                        actions: const [],
                                      );
                                    },
                                  );
                                },
                                child: Image.network(
                                  widget.firstImageString,
                                  // height: 25.h,
                                  // height: 35.h,
                                  // height:
                                  // screenSize.width < 567 ? 45.h :
                                  // 65.h,
                                  height: screenSize.width < 567 ? 35.h : 65.h,
                                  // fit: screenSize.width < 567
                                  //     ? BoxFit.cover
                                  //     : BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      "We are having problem while loading images ${widget.firstImageString}}",
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    // height: screenSize.width < 667 ? 12 : 0.5.h,
                    height: 0.5.h,
                  ),
                  if (widget.showGalleryText == null ||
                      widget.showGalleryText == true)
                    Text(
                      widget.firstGalerieName,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  if (widget.showGalleryText == null ||
                      widget.showGalleryText == true)
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                FotoPage(
                              albumName: widget.firstGalerieName,
                              showGalleryText: true,
                            ), //This has to be changed to MyHomePage(),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero, // and this
                      ),
                      child: Text(
                        "See galery",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            // width: 10.w,

            width: screenSize.width > 1000

                /// In Two Card YOu can specify value based on your need..
                /// here i am using 3% width of screen
                ? 3.w
                : screenSize.width > 440
                    ? 6.w
                    : 4,
          ),
          Container(
            constraints: screenSize.width > 440
                ? const BoxConstraints()
                : BoxConstraints(
                    maxWidth: screenSize.width * 0.47,
                  ),
            // padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Column(
              children: [
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            widget.links != null
                                ? VideoCard(
                                    thumbnailLink:
                                        widget.firbaseObject!.get("thumbnail"),
                                    videoPlayerLink: widget.secondImageString,
                                  )
                                : widget.imageType != null
                                    ? SizedBox(
                                        height: screenSize.width < 567
                                            ? 15.h
                                            : 65.h,
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              barrierColor:
                                                  Colors.white,
                                              builder: (context) {
                                                return AlertDialog(
                                                  elevation: 300,
                                                  backgroundColor:
                                                      Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  content: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: screenSize.width *
                                                          0.92,
                                                      height:
                                                          screenSize.height *
                                                              0.92,
                                                      child: Center(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: widget
                                                              .secondImageString,

                                                          width:
                                                              screenSize.width *
                                                                  2,
                                                          height: screenSize
                                                                      .width <
                                                                  480
                                                              ? screenSize
                                                                      .height *
                                                                  1.8
                                                              : screenSize
                                                                      .height *
                                                                  1.8,

                                                          fit: BoxFit.contain,
                                                          fadeInCurve:
                                                              Curves.ease,
                                                          fadeOutCurve:
                                                              Curves.ease,
                                                          placeholder:
                                                              (BuildContext
                                                                          context,
                                                                      String
                                                                          url) =>
                                                                  Container(
                                                            // width: 320,
                                                            height: 40.h,
                                                            // color: Colors.white,
                                                          ),
                                                          // imageRenderMethodForWeb: ImageR,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  actions: const [],
                                                );
                                              },
                                            );
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: widget.secondImageString,
                                            // height: screenSize.width > 550
                                            //     ? 60.h
                                            //     : 30.h,
                                            height: screenSize.width < 567
                                                ? 45.h
                                                : 65.h,

                                            fadeInCurve: Curves.ease,
                                            fadeOutCurve: Curves.ease,
                                            fit: screenSize.width > 550
                                                ? BoxFit.contain
                                                : BoxFit.fill,
                                            placeholder: (BuildContext context,
                                                    String url) =>
                                                Container(
                                              // width: 320,
                                              height: screenSize.width > 550
                                                  ? 65.h
                                                  // ? 35.h
                                                  : 30.h,
                                              // height: 240,
                                              // color: Colors.white,
                                            ),
                                            // imageRenderMethodForWeb: ImageR,
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierColor:
                                                Colors.white,
                                            builder: (context) {
                                              return AlertDialog(
                                                elevation: 300,
                                                backgroundColor:
                                                    Colors.white,
                                                contentPadding: EdgeInsets.zero,
                                                content: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        screenSize.width * 0.92,
                                                    height: screenSize.height *
                                                        0.92,
                                                    child: Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl: widget
                                                            .secondImageString,

                                                        width:
                                                            screenSize.width *
                                                                2,
                                                        height: screenSize
                                                                    .width <
                                                                480
                                                            ? screenSize
                                                                    .height *
                                                                1.8
                                                            : screenSize
                                                                    .height *
                                                                1.8,

                                                        fit: BoxFit.contain,
                                                        fadeInCurve:
                                                            Curves.ease,
                                                        fadeOutCurve:
                                                            Curves.ease,
                                                        placeholder:
                                                            (BuildContext
                                                                        context,
                                                                    String
                                                                        url) =>
                                                                Container(
                                                          // width: 320,
                                                          height: 40.h,
                                                          // color: Colors.white,
                                                        ),
                                                        // imageRenderMethodForWeb: ImageR,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                actions: const [],
                                              );
                                            },
                                          );
                                        },
                                        child: Image.network(
                                          widget.secondImageString,
                                          // fit: BoxFit.cover,
                                          height: screenSize.width < 567
                                              ? 35.h
                                              : 65.h,
                                          // height: 65.h,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Text(
                                              "We are having problem while loading images ${error.toString()}",
                                            );
                                          },
                                        ),
                                      ),
                          ],
                        ),
                      ),
                      SizedBox(
                        //height: screenSize.width < 667 ? 12 : 0.5.h,
                        height: 0.5.h,
                      ),
                      if (widget.showGalleryText == null ||
                          widget.showGalleryText == true)
                        Text(
                          widget.secondGalerieName,
                          style: const TextStyle(
                            // fontSize: 1.1.h,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      if (widget.showGalleryText == null ||
                          widget.showGalleryText == true)
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        FotoPage(
                                  albumName: widget.secondGalerieName,
                                  showGalleryText: true,
                                ), //This has to be changed to MyHomePage(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero, // Set this
                            padding: EdgeInsets.zero, // and this
                          ),
                          child: Text(
                            "See galery",
                            style: TextStyle(
                              // fontSize: 1.1.h,
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
