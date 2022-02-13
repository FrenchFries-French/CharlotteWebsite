import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/FotoPage.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/videoCard.dart';
import 'package:sizer/sizer.dart';

class OneCard extends StatefulWidget {
  final String? imageType;
  final bool? video;
  final bool? showGalleryText;
  final QueryDocumentSnapshot<Map<String, dynamic>>? firbaseObject;
  OneCard({
    required this.imageString,
    required this.heightMultiplicator,
    required this.galerieName,
    required this.kuenstler,
    this.showGalleryText,
    this.video,
    this.imageType,
    this.firbaseObject,
  });

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
            GestureDetector(
                //Vorher war es Mouse Region
                onTap: () {
                  print("Tapped");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          // minWidth: MediaQuery.of(context).size.width * 0.8,
                          maxWidth: MediaQuery.of(context).size.width * 0.95),
                      alignment: AlignmentDirectional.center,
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          widget.video != null
                              ? VideoCard(
                                  thumbnailLink:
                                      widget.firbaseObject!.get("thumbnail"),
                                  videoPlayerLink: widget.imageString,
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
                                                  height:
                                                      screenSize.height * 0.92,
                                                  child: Center(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          widget.imageString,
                                                      fit: BoxFit.contain,
                                                      width: screenSize.width *
                                                          0.92,
                                                      height: screenSize.width <
                                                              480
                                                          ? screenSize.height *
                                                              0.5
                                                          : screenSize.height *
                                                              0.92,
                                                      fadeInCurve: Curves.ease,
                                                      fadeOutCurve: Curves.ease,
                                                      placeholder:
                                                          (BuildContext context,
                                                                  String url) =>
                                                              Container(),
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
                                        imageUrl: widget.imageString,
                                        // width: 1000,
                                        height: screenSize.width > 550
                                            ? 40.h
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
                                          height: screenSize.width > 550
                                              ? 40.h
                                              : 30.h,
                                          // color: Colors.white,
                                        ),
                                        // imageRenderMethodForWeb: ImageR,
                                      ),
                                    )
                                  : Image.asset(
                                      widget.imageString,
                                      height: 40.h,
                                      fit: BoxFit.cover,
                                    ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width > 560 ? 0.5.h : 10,
                    ),
                    if (widget.showGalleryText == null ||
                        widget.showGalleryText == true)
                      Container(
                        child: Text(
                          widget.galerieName,
                          style: TextStyle(fontSize: 1.1.h),
                        ),
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
                                albumName: widget.galerieName,
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
                )),
          ],
        ),
      ],
    );
  }
}
