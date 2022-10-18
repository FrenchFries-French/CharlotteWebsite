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
  final List<Map<String, dynamic>> _items = [];
  double elevation = 0.0;
  Offset translate = const Offset(0, 0);
  @override
  void initState() {
    getItemsFromFirebase().then((value) {
      setState(() {
        _items.addAll(value);
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
          child: MasonryGrid(
              column: screenSize.width < 560 ? 2 : 3,
              mainAxisSpacing: screenSize.width < 560 ? 5 : 7,
              crossAxisSpacing: screenSize.width < 560 ? 5 : 7,
              children: List.generate(
                _items.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        useSafeArea: false,
                        context: context,
                        barrierColor: Colors.black,
                        builder: (context) {
                          return AlertDialog(
                            elevation: 300,
                            backgroundColor: Colors.black,
                            contentPadding: EdgeInsets.zero,
                            actions: [
                              FloatingActionButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Icon(Icons.close),
                                backgroundColor: Colors.grey,
                              ),
                            ],
                            content: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: _items[index]['link'],
                                  fit: BoxFit.contain,
                                  width: screenSize.width * 2,
                                  height: screenSize.width < 480
                                      ? screenSize.height * 1.8
                                      : screenSize.height * 1.8,
                                  fadeInCurve: Curves.ease,
                                  fadeOutCurve: Curves.ease,
                                  placeholder:
                                      (BuildContext context, String url) =>
                                          Container(),
                                  // imageRenderMethodForWeb: ImageR,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            blurRadius: _items[index]['elevation'],
                          ),
                        ],
                      ),
                      child: Image.network(
                        _items[index]['link'],
                      ),
                    ),
                  );
                },
              )),
        ));
  }

  Future<List<Map<String, dynamic>>> getItemsFromFirebase() async {
    final List<Map<String, dynamic>> _items = [];
    //To get images from firebase add or remove collection names from list.
    final List<String> listOfCollections = [
      'Collection',
    ];
    //This side will provide firebase collection nameS
    for (int i = 0; i < listOfCollections.length; i++) {
      var collection = listOfCollections[i];
      //print(collection);
      await FirebaseFirestore.instance
          .collection(collection.toString())
          .get()
          .then((value) {
        //accessing inside of the collection
        value.docs.forEach((element) {
          //we are getting data by one by
          //print(element.id);
          Map<String, dynamic> data = {
            "id": element.id,
            "link": element['link'][0],
            "elevation": 0.0,
            "order": element['order'],
          };
          _items.add(data);
        });
      }); //after getting data and added to the _items we apply sort algorithm to sort _item array according to the order value.
      _items.sort((a, b) => a['order'].compareTo(b['order']));
    }
    return _items;
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
        ),
      ),
    );
  }
}
