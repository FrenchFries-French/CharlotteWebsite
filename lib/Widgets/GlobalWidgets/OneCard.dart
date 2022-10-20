import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/FotoPage.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/videoCard.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui' as ui;

class OneCard extends StatefulWidget {
  final String? imageType;
  final bool? video;
  final bool? showGalleryText;
  final bool? isHomePageForward;
  final bool? isHorizontal;
  final QueryDocumentSnapshot<Map<String, dynamic>>? firbaseObject;
  const OneCard({
    Key? key,
    required this.imageString,
    required this.heightMultiplicator,
    required this.galerieName,
    required this.kuenstler,
    this.showGalleryText,
    this.isHomePageForward,
    this.video,
    this.imageType,
    this.firbaseObject,
    this.isHorizontal,
  }) : super(key: key);

  final String imageString;
  final double heightMultiplicator;
  final String galerieName;
  final String kuenstler;

  @override
  _OneCardState createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                //Vorher war es Mouse Region
                onTap: () {
                  if (kDebugMode) {
                    print("Tapped");
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          // minWidth: MediaQuery.of(context).size.width * 0.8,
                          maxWidth: MediaQuery.of(context).size.width * 0.95),
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        // clipBehavior: Clip.hardEdge,
                        // alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          InkWell(
                              onTap: () {
                                if (widget.isHomePageForward == true) {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              FotoPage(
                                        albumName: widget.galerieName,
                                        showGalleryText:
                                            widget.showGalleryText ?? true,
                                      ), //This has to be changed to MyHomePage(),
                                      transitionDuration:
                                          const Duration(seconds: 0),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    useSafeArea: false,
                                    context: context,
                                    barrierColor: Colors.black,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: EdgeInsets.zero,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 300,
                                        backgroundColor: Colors.black,
                                        contentPadding: EdgeInsets.zero,
                                        content: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: CachedNetworkImage(
                                                  imageUrl: widget.imageString,
                                                  fit: BoxFit.contain,
                                                  width: screenSize.width * 2,
                                                  height: screenSize.width < 480
                                                      ? screenSize.height * 1.8
                                                      : screenSize.height * 1.8,
                                                  fadeInCurve: Curves.ease,
                                                  fadeOutCurve: Curves.ease,
                                                  placeholder:
                                                      (BuildContext context,
                                                              String url) =>
                                                          Container(),
                                                  // imageRenderMethodForWeb: ImageR,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: widget.imageString,
                                    fit: screenSize.width > 800
                                        ? BoxFit.contain
                                        : BoxFit.contain,
                                    //width: screenSize.width * 0.5,
                                    height:
                                        screenSize.width < 550 ? null : 87.h,

                                    fadeInCurve: Curves.ease,
                                    fadeOutCurve: Curves.ease,
                                    placeholder:
                                        (BuildContext context, String url) =>
                                            Container(
                                      // width: 320,
                                      height:
                                          screenSize.width < 567 ? 25.h : 65.h,
                                      // height: screenSize.width > 550 ? 40.h : 25.h,
                                      // color: Colors.white,
                                    ),
                                    // imageRenderMethodForWeb: ImageR,
                                  ),
                                  if (widget.showGalleryText == null ||
                                      widget.showGalleryText == true)
                                    Text(
                                      widget.galerieName,
                                      style: const TextStyle(
                                        // fontSize: screenSize.height * 0.016,
                                        fontSize: 16,
                                      ),
                                    ),
                                  if (widget.showGalleryText == null ||
                                      widget.showGalleryText == true)
                                    /*TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                FotoPage(
                                              albumName: widget.galerieName,
                                              showGalleryText:
                                                  widget.showGalleryText ??
                                                      true,
                                            ), //This has to be changed to MyHomePage(),
                                            transitionDuration:
                                                const Duration(seconds: 0),
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
                                            // fontSize: screenSize.height * 0.01,
                                            fontSize: 14,
                                            color: Colors.grey[600]),
                                      ),
                                    ),*/
                                    SizedBox(
                                      height: 1.h,
                                    )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
