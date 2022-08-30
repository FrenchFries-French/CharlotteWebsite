import 'package:charletwebsite/Widgets/GlobalWidgets/videoCard.dart';
import 'package:charletwebsite/utils/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/OneCard.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TwoCards.dart';
import 'package:sizer/sizer.dart';

//  This Widget will load list of data from Firebase
class LoadMoreFireStoreWidget extends StatefulWidget {
  final String collectionName;
  final int? initialLimit;
  final bool? showGalleryText;
  final bool? isHomePageForward;
  const LoadMoreFireStoreWidget({
    Key? key,
    this.initialLimit,
    this.showGalleryText,
    required this.isHomePageForward,
    required this.collectionName,
  }) : super(key: key);

  @override
  _LoadMoreFireStoreWidgetState createState() =>
      _LoadMoreFireStoreWidgetState();
}

class _LoadMoreFireStoreWidgetState extends State<LoadMoreFireStoreWidget> {
  int limit = 10;
  @override
  void initState() {
    super.initState();
    limit = widget.initialLimit ?? 10; // default
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection(widget.collectionName) // items
                .orderBy("order",
                    descending:
                        true) // wenn ich 1 als erstes haben will, das hier auf false stellen
                .limit(limit)
                .snapshots(),
            builder: (context, stream) {
              if (stream.hasData) {
                if (stream.data!.docs.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Data exist in collection ${widget.collectionName}",
                      ),
                    ),
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: stream.data!.docs.map((currentItem) {
                        var docData = currentItem.data();
                        ImageType imageType = ImageType.OneCardImage;

                        if (docData.containsKey("type")) {
                          if ("${docData["type"]}".toLowerCase() == "onecard") {
                            imageType = ImageType.OneCardImage;
                          } else if ("${docData["type"]}".toLowerCase() ==
                              "twocard") {
                            imageType = ImageType.TwoCardImage;
                          } else if ("${docData["type"]}".toLowerCase() ==
                              "videocard") {
                            imageType = ImageType.VideoCard;
                          }
                        }

                        return Container(
                          // color: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: imageType == ImageType.OneCardImage
                              ? OneCard(
                                  imageString: docData['link'][0],
                                  heightMultiplicator: 12,
                                  isHomePageForward: widget.isHomePageForward,
                                  galerieName: docData.containsKey("name")
                                      ? docData['name']
                                      : "",
                                  kuenstler: "test",
                                  imageType: "network",
                                  firbaseObject: currentItem,
                                  showGalleryText: docData['showText'] ?? true,
                                )
                              : imageType == ImageType.TwoCardImage
                                  ? TwoCards(
                                    isHomePageForward: widget.isHomePageForward,
                                      firstGalerieName:
                                          "${docData['firstname']}",
                                      secondImageString:
                                          "${docData['link'][1]}",
                                      firstImageString: "${docData['link'][0]}",
                                      secondGalerieName:
                                          "${docData['secondname']}",
                                      showGalleryText:
                                          docData['showText'] ?? true,
                                    )
                                  : imageType == ImageType.VideoCard
                                      ? VideoCard(
                                          thumbnailLink:
                                              "${docData[ThumbnailKey][1]}",
                                          videoPlayerLink:
                                              "${docData['link'][0]}",
                                        )
                                      : const Text("No image reference added"),
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (stream.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Error ${stream.error}"),
                  ),
                );
              } else {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 600,
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ));
                // return Text(
                //     "We Could not find any data  ${this.widget.collectionName}");
              }
            });
      },
    );
  }
}

//  Now Load More Button Widget using ListView
