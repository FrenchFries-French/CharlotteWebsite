import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// https://pub.dev/packages/carousel_slider Link zum Package


class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  List imgList = [
    'assets/images/Mathildedoppelt.jpeg',
    'assets/images/reveuse2.jpeg',

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: screenSize.width,
     // height: screenSize.height*0.8,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 42.h,
          //aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false, // AUTOPLAY MUSS UNBEDINGT AN
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(seconds: 3),
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
        items: imgList
            .map((item) => Container(
          child: Center(
              child: Image.network(
                item,
                fit: BoxFit.fitWidth,
                width: 200.w,
                height: 200.h,
              )),
        ))
            .toList(),
      ),
    );
  }
}
