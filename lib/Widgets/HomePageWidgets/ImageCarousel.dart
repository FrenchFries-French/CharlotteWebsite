import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// https://pub.dev/packages/carousel_slider Link zum Package

class ImageCarousel extends StatefulWidget {
  final double? height;
  const ImageCarousel({Key? key, this.height}) : super(key: key);
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List imgList = [
    'assets/images/Header_A.JPG',
    'assets/images/Header_B.JPG',
    'assets/images/Header_C.JPG',
    'assets/images/Header_D.JPG',
    'assets/images/Header_E.JPG',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: screenSize.width,
      // height: screenSize.height*0.8,
      child: CarouselSlider(
        options: CarouselOptions(
          height: this.widget.height ?? 42.h,
          //aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true, // AUTOPLAY MUSS UNBEDINGT AN
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(seconds: 3),
          enlargeCenterPage: false,
          scrollDirection: Axis.vertical,
        ),
        items: imgList
            .map((item) => Container(
          child: Center(
              child: Image.network(
                "assets/" + item,
                // fit: BoxFit.fitHeight,
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
              )),
        ))
            .toList(),
      ),
    );
  }
}

















  /*
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height ?? 42.h,
        //aspectRatio: 16/9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false, // AUTOPLAY MUSS UNBEDINGT AN
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(seconds: 3),
        enlargeCenterPage: false,
        scrollDirection: Axis.vertical,
      ),
      items: imgList
          .map((item) => Center(
          child: Image.network(
            item,
            // fit: BoxFit.fitHeight,
            fit: BoxFit.cover,
            width: 200.w,
            height: 200.h,
          )))
          .toList(),
    );
  }
}

*/

/*
imgList
          .map((item) => Center(
                  child: Image.network(
                item,
                // fit: BoxFit.fitHeight,
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
              )))
          .toList(),
 */