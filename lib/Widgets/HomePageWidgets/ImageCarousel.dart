import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// https://pub.dev/packages/carousel_slider Link zum Package

class ImageCarousel extends StatefulWidget {
  final double? height;
  ImageCarousel({this.height});
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List imgList = [
    'assets/images/Header_1.JPG',
    'assets/images/Header_2.JPG',
    'assets/images/Header_3.JPG',
    'assets/images/Header_4.JPG',
    'assets/images/Header_5.JPG',
    'assets/images/Header_6.JPG',
    'assets/images/Header_7.JPG',
    'assets/images/Header_8.JPG',
    'assets/images/Header_9.JPG',
    'assets/images/Header_10.JPG',
    'assets/images/Header_11.JPG',
    'assets/images/Header_12.JPG',
    'assets/images/Header_13.JPG',
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
                    item,
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
