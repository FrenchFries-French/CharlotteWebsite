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
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            children: [
              for (var index = 0; index < _items.length; index++)
                StaggeredGridTile.count(
                    crossAxisCellCount: _items[index]['vertical'] ? 1 : 2,
                    mainAxisCellCount: 1,
                    child: InkWell(
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
                                        imageUrl: _items[index]['link'],
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
                          fit: _items[index]['vertical']
                              ? BoxFit.fitWidth
                              : BoxFit.cover,
                        ),
                      ),
                    )),
            ],
          ),
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
            "vertical": element['vertical'],
          };
          _items.add(data);
        });
      }); //after getting data and added to the _items we apply sort algorithm to sort _item array according to the order value.
      _items.sort((a, b) => a['order'].compareTo(b['order']));
    }

    return _items;
  }
}
