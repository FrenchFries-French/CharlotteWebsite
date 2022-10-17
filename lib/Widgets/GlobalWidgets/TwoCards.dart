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
  final bool? isHomePageForward;
  final QueryDocumentSnapshot<Map<String, dynamic>>? firbaseObject;
  const TwoCards({
    Key? key,
    this.firstHeightMultiplicator = 0.45,
    this.secondHeightMultiplicator = 0.6,
    required this.firstGalerieName,
    required this.secondImageString,
    required this.firstImageString,
    required this.secondGalerieName,
    this.isHomePageForward,
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
                                  if (widget.isHomePageForward == true) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                FotoPage(
                                          albumName: widget.firstGalerieName,
                                          showGalleryText: true,
                                        ), //This has to be changed to MyHomePage(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ),
                                    );
                                  } else {
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
                                  }
                                },
                                child: Image.network(
                                  widget.firstImageString,
                                  width: screenSize.width / 2.5,
                                  fit: screenSize.width < 567
                                      ? BoxFit.cover
                                      : BoxFit.contain,
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
            width: screenSize.width > 1000
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
                                            if (widget.isHomePageForward ==
                                                true) {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation1,
                                                          animation2) =>
                                                      FotoPage(
                                                    albumName:
                                                        widget.firstGalerieName,
                                                    showGalleryText: true,
                                                  ), //This has to be changed to MyHomePage(),
                                                  transitionDuration:
                                                      const Duration(
                                                          seconds: 0),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                barrierColor: Colors.white,
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
                                                        width:
                                                            screenSize.width *
                                                                0.92,
                                                        height:
                                                            screenSize.height *
                                                                0.92,
                                                        child: Center(
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: widget
                                                                .firstImageString,
                                                            width: screenSize
                                                                    .width *
                                                                2,
                                                            height: screenSize
                                                                        .width <
                                                                    480
                                                                ? screenSize
                                                                        .height *
                                                                    1.8
                                                                : screenSize
                                                                        .height *
                                                                    2.8,
                                                            fit: BoxFit.contain,
                                                            fadeInCurve:
                                                                Curves.ease,
                                                            fadeOutCurve:
                                                                Curves.ease,
                                                            placeholder: (BuildContext
                                                                        context,
                                                                    String
                                                                        url) =>
                                                                Container(
                                                              // width: 320,
                                                              height: 40.h,
                                                              // color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    actions: const [],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: widget.secondImageString,
                                            // height: screenSize.width > 550
                                            //     ? 60.h
                                            //     : 30.h,
                                            height: screenSize.width < 567
                                                ? 25.h
                                                : 65.h,

                                            fadeInCurve: Curves.ease,
                                            fadeOutCurve: Curves.ease,
                                            fit: screenSize.width > 550
                                                ? BoxFit.contain
                                                : BoxFit.fill,
                                            placeholder: (BuildContext context,
                                                    String url) =>
                                                Container(
                                              height: screenSize.width > 550
                                                  ? 65.h
                                                  : 30.h,
                                            ),
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          if (widget.isHomePageForward ==
                                              true) {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation1,
                                                        animation2) =>
                                                    FotoPage(
                                                  albumName:
                                                      widget.firstGalerieName,
                                                  showGalleryText: true,
                                                ),
                                                transitionDuration:
                                                    const Duration(seconds: 0),
                                              ),
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              barrierColor: Colors.white,
                                              builder: (context) {
                                                return AlertDialog(
                                                  elevation: 300,
                                                  backgroundColor: Colors.white,
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
                                                              .firstImageString,

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
                                                                  2.8,

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
                                                            height: 40.h,
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
                                          }
                                        },
                                        child: Image.network(
                                          widget.secondImageString,
                                          fit: screenSize.width < 567
                                              ? BoxFit.cover
                                              : BoxFit.contain,
                                          
                                          width: screenSize.width / 2.5,
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
                      SizedBox(
                        // height: screenSize.width > 560 ? 0.5.h : 10,
                        height: 0.5.h,
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
