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
  const LoadMoreFireStoreWidget({
    Key? key,
    this.initialLimit,
    this.showGalleryText,
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
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: currentItem.data().containsKey("type")
                              ? currentItem.get("type").toString() == "onecard"
                                  ? OneCard(
                                      imageString: currentItem.get('link')[0],
                                      heightMultiplicator: 12,
                                      galerieName:
                                          currentItem.data().containsKey("name")
                                              ? currentItem.get('name')
                                              : "",
                                      kuenstler: "test",
                                      imageType: "network",
                                      firbaseObject: currentItem,
                                      showGalleryText: currentItem
                                              .data()
                                              .containsKey("showText")
                                          ? currentItem.get("showText")
                                          : widget.showGalleryText,
                                    )
                                  : currentItem.get("type").toString() ==
                                          "videocard"
                                      ? OneCard(
                                          showGalleryText:
                                              widget.showGalleryText,
                                          imageString:
                                              currentItem.get('link')[0],
                                          heightMultiplicator: 12,
                                          galerieName: currentItem
                                                  .data()
                                                  .containsKey("name")
                                              ? currentItem.get('name')
                                              : "",
                                          kuenstler: "test",
                                          imageType: "network",
                                          video: true,
                                          firbaseObject: currentItem,
                                        )
                                      : TwoCards(
                                          showGalleryText: currentItem
                                                  .data()
                                                  .containsKey("showText")
                                              ? currentItem.get("showText")
                                              : widget.showGalleryText,
                                          firstGalerieName: currentItem
                                                  .data()
                                                  .containsKey("firstname")
                                              ? currentItem.get('firstname')
                                              : "",
                                          secondImageString:
                                              currentItem.get('link')[1],
                                          firstImageString:
                                              currentItem.get('link')[0],
                                          secondGalerieName: currentItem
                                                  .data()
                                                  .containsKey("secondname")
                                              ? currentItem.get('secondname')
                                              : "",
                                          imageType: "network",
                                          firbaseObject: currentItem,
                                        )
                              // showGalleryText: this.widget.showGalleryText,
                              : const Text("No image reference added"),
                        );
                      }).toList(),
                    ),
                    stream.data!.docs.length < limit &&
                            stream.data!.docs.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              child: Text(
                                "Show more",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2.w,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                //  Here it will load more data based on limit if initially we have 10 items now it will load 10 more
                                //  and so on
                                state.call(() {
                                  limit = limit + 5;
                                });
                              },
                            ),
                          )
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
