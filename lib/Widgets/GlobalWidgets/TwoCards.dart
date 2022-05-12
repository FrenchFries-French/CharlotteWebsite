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
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.95),
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
                            : widget.imageType != null
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black.withOpacity(0.6),
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 300,
                                            backgroundColor: Colors.transparent,
                                            contentPadding: EdgeInsets.zero,
                                            content: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: SizedBox(
                                                // height: screenSize.height * 0.8,
                                                // width: screenSize.width * 0.8,
                                                width: screenSize.width * 0.92,
                                                height:
                                                    screenSize.height * 0.92,
                                                child: Center(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        widget.firstImageString,
                                                    width:
                                                        screenSize.width * 0.92,
                                                    height: screenSize.width <
                                                            480
                                                        ? screenSize.height *
                                                            0.5
                                                        : screenSize.height *
                                                            0.92,
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
                                    child: SizedBox(
                                      height:
                                          screenSize.width > 550 ? 35.h : 30.h,
                                      child: ClipRRect(
                                        child: CachedNetworkImage(
                                          imageUrl: widget.firstImageString,
                                          height: screenSize.width > 550
                                              ? 35.h
                                              : 30.h,
                                          fit: screenSize.width > 550
                                              ? BoxFit.contain
                                              : BoxFit.fill,
                                          fadeInCurve: Curves.ease,
                                          fadeOutCurve: Curves.ease,
                                          placeholder: (BuildContext context,
                                                  String url) =>
                                              Container(
                                            // width: 320,
                                            height: 35.h,
                                            // color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Image.network(
                                    widget.firstImageString,
                                    // height: 25.h,
                                    height: 35.h,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Text(
                                        "We are having problem while loading images ${widget.firstImageString}}",
                                      );
                                    },
                                  ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  if (widget.showGalleryText == null ||
                      widget.showGalleryText == true)
                    Text(
                      widget.firstGalerieName,
                      style: TextStyle(fontSize: 1.1.h, color: Colors.black),
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
                      child: Text(
                        "See galery",
                        style:
                            TextStyle(fontSize: 1.1.h, color: Colors.grey[600]),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            // width: 10.w,
            width: screenSize.width > 440 ? 10.w : 4,
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
                                    ? InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierColor:
                                                Colors.black.withOpacity(0.6),
                                            builder: (context) {
                                              return AlertDialog(
                                                elevation: 300,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                                0.92,
                                                        height: screenSize
                                                                    .width <
                                                                480
                                                            ? screenSize
                                                                    .height *
                                                                0.5
                                                            : screenSize
                                                                    .height *
                                                                0.92,

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
                                        child: SizedBox(
                                          height: screenSize.width > 550
                                              ? 35.h
                                              : 30.h,
                                          child: CachedNetworkImage(
                                            imageUrl: widget.secondImageString,
                                            height: screenSize.width > 550
                                                ? 35.h
                                                : 30.h,
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
                                                  ? 35.h
                                                  : 30.h,
                                              // height: 240,
                                              // color: Colors.white,
                                            ),
                                            // imageRenderMethodForWeb: ImageR,
                                          ),
                                        ),
                                      )
                                    : Image.network(
                                        widget.secondImageString,
                                        fit: BoxFit.cover,
                                        height: 35.h,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Text(
                                            "We are having problem while loading images ${error.toString()}",
                                          );
                                        },
                                      ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      if (widget.showGalleryText == null ||
                          widget.showGalleryText == true)
                        Text(
                          widget.secondGalerieName,
                          style: TextStyle(
                            fontSize: 1.1.h,
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
                          child: Text(
                            "See galery",
                            style: TextStyle(
                                fontSize: 1.1.h, color: Colors.grey[600]),
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
