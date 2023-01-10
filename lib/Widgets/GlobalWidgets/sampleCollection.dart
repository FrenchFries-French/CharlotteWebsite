import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SampleCollection extends StatefulWidget {
  const SampleCollection({Key? key}) : super(key: key);

  @override
  State<SampleCollection> createState() => _SampleCollectionState();
}

class _SampleCollectionState extends State<SampleCollection> {
  final List<Map<String, dynamic>> _leftside = [];

  final List<Map<String, dynamic>> _middleside = [];

  final List<Map<String, dynamic>> _rightside = [];
  double elevation = 0.0;
  Offset translate = const Offset(0, 0);
  @override
  void initState() {
    getItemsFromFirebase('left side collection').then((value) {
      setState(() {
        _leftside.addAll(value);
      });
      getItemsFromFirebase('middle side collection').then((value) {
        setState(() {
          _middleside.addAll(value);
        });
        getItemsFromFirebase('right side collection').then((value) {
          setState(() {
            _rightside.addAll(value);
          });
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: const TopNavBar(),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _leftside.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          useSafeArea: false,
                          context: context,
                          barrierColor: Colors.black,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                        imageUrl: _leftside[index]['link'],
                                        fit: BoxFit.contain,
                                        width: screenSize.width * 2,
                                        height: screenSize.width < 480
                                            ? screenSize.height * 1.8
                                            : screenSize.height * 1.8,
                                        fadeInCurve: Curves.ease,
                                        fadeOutCurve: Curves.ease,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        placeholder: (BuildContext context,
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
                      },
                      child: Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _leftside[index]['link'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _middleside.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          useSafeArea: false,
                          context: context,
                          barrierColor: Colors.black,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                        imageUrl: _middleside[index]['link'],
                                        fit: BoxFit.contain,
                                        width: screenSize.width * 2,
                                        height: screenSize.width < 480
                                            ? screenSize.height * 1.8
                                            : screenSize.height * 1.8,
                                        fadeInCurve: Curves.ease,
                                        fadeOutCurve: Curves.ease,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        placeholder: (BuildContext context,
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
                      },
                      child: Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _middleside[index]['link'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _rightside.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          useSafeArea: false,
                          context: context,
                          barrierColor: Colors.black,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                        imageUrl: _rightside[index]['link'],
                                        fit: BoxFit.contain,
                                        width: screenSize.width * 2,
                                        height: screenSize.width < 480
                                            ? screenSize.height * 1.8
                                            : screenSize.height * 1.8,
                                        fadeInCurve: Curves.ease,
                                        fadeOutCurve: Curves.ease,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        placeholder: (BuildContext context,
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
                      },
                      child: Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _rightside[index]['link'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            )
          ],
        )));
  }

  Future<List<Map<String, dynamic>>> getItemsFromFirebase(
      collectionName) async {
    final List<Map<String, dynamic>> _items = [];
    var collection = collectionName;
    try {
      await FirebaseFirestore.instance
          .collection(collection.toString())
          .get()
          .then((value) {
        value.docs.forEach((element) {
          Map<String, dynamic> data = {
            "id": element.id,
            "link": element['link'][0],
            "order": element['order'],
            "side": collectionName,
          };
          _items.add(data);
        });
      });
      _items.sort((a, b) => a['order'].compareTo(b['order']));
      return _items;
    } catch (e) {
      return [];
    }
  }
}
