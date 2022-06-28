import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  final List<Map<String, dynamic>> _items = [];
  double elevation = 4.0;
  Offset translate = Offset(0, 0);
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Samet Sarial'),
        ),
        body: MasonryGridView.count(
          itemCount: _items.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onHover: (value) {
                if (value) {
                  setState(() {
                    _items[index]['elevation'] = 90.0;
                  });
                } else {
                  setState(() {
                    _items[index]['elevation'] = 4.0;
                  });
                }
              },
              onTap: () {
                print(_items[index]['id']);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroPhotoViewRouteWrapper(
                      imageProvider: NetworkImage(
                        _items[index]['link'],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
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
        ));
  }

  Future<List<Map<String, dynamic>>> getItemsFromFirebase() async {
    final List<Map<String, dynamic>> _items = [];
    await FirebaseFirestore.instance.collection('Poolside').get().then((value) {
      value.docs.forEach((element) {
        print(element.id);
        Map<String, dynamic> data = {
          "id": element.id,
          "link": element['link'][0],
          "elevation": 0.0
          //"order": element['order'],
          //"type": element['type'],
          //"value": element['value'],
          //"showText": element['showText'],
        };
        _items.add(data);
      });
    });
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
