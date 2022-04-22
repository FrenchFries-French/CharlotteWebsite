// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/LoadMoreWidget.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/ImageCarousel.dart';
import '../Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import '../Widgets/HomePageWidgets/ImageCarousel.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatelessWidget {
  // @override

  MyHomePage({Key? key}) : super(key: key);
  Future<void> _scrollToTop() async {
    await _scrollController.animateTo(0,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        // scrollBehavior: MaterialScrollBehavior(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: false,
            leading: Container(),
            backgroundColor: Colors.white,
            expandedHeight:
                screenSize.width > 1145 ? screenSize.height * 0.6 : 250,
            collapsedHeight:
                screenSize.width > 1145 ? screenSize.height * 0.6 : 250,
            flexibleSpace: ClipRRect(
              child: ImageCarousel(
                height: screenSize.height * 0.6,
              ),
            ),
          ),
          SliverAppBar(
            expandedHeight: 100.w > 767 ? 150 : kToolbarHeight,
            collapsedHeight: 100.w > 767 ? 100 : kToolbarHeight,
            pinned: true,
            elevation: 0,
            leading: Container(),
            backgroundColor: Colors.white,
            flexibleSpace: TopNavBar(),
          ),
        ],
        // controller: _scrollController,
        body: SingleChildScrollView(
          child: SizedBox(
            // width: screenSize.width,
            // height: screenSize.height,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LeftColumn Stream
                    Expanded(
                      child: Container(
                        // height: screenSize.height * 0.6,
                        width: double.infinity,
                        // color: Colors.black,
                        child: StreamBuilder<
                                QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection("LeftColumn")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator.adaptive();
                              }
                              if (snapshot.data!.docs.isEmpty) {
                                return Text("No Data Exists");
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (screenSize.width < 1080) ...[
                                    for (var item in snapshot.data!.docs)
                                      Container(
                                          width: screenSize.width > 767
                                              ? 22.w
                                              : 46.w,
                                          height: 60.h,
                                          color: Colors.yellow,
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: item.data()['link']))
                                  ],
                                  if (screenSize.width > 1080) ...[
                                    Wrap(
                                      spacing: 3.w,
                                      runSpacing: 2.w,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        for (var item in snapshot.data!.docs)
                                          Container(
                                            width: 100.w > 767 ? 22.w : 46.w,
                                            height: 60.h,
                                            color: Colors.yellow,
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: item.data()['link']),
                                          )
                                      ],
                                    ),
                                  ],
                                ],
                              );
                            }),
                      ),
                    ),
                    // Right Side Column
                    Expanded(
                      child: Container(
                        // height: screenSize.height * 0.6,
                        width: double.infinity,
                        // color: Colors.black,
                        child: StreamBuilder<
                                QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection("RightColumn")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator.adaptive();
                              }
                              if (snapshot.data!.docs.isEmpty) {
                                return Text("No Data Exists");
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (screenSize.width < 1080) ...[
                                    for (var item in snapshot.data!.docs)
                                      Container(
                                          width: screenSize.width > 767
                                              ? 22.w
                                              : 46.w,
                                          height: 60.h,
                                          color: Colors.yellow,
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: item.data()['link']))
                                  ],
                                  if (screenSize.width > 1080) ...[
                                    Wrap(
                                      spacing: 3.w,
                                      runSpacing: 2.w,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        for (var item in snapshot.data!.docs)
                                          Container(
                                            width: 100.w > 767 ? 22.w : 46.w,
                                            height: 60.h,
                                            color: Colors.yellow,
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: item.data()['link']),
                                          )
                                      ],
                                    ),
                                  ],
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                )
                // : Container(
                //     margin: EdgeInsets.symmetric(
                //       horizontal: 0,
                //     ),
                //     child: LoadMoreFireStoreWidget(
                //       collectionName: "HomePage",
                //       initialLimit: 10,
                //     ),
                //   ),
                ,
                screenSize.width < 1080
                    ? FittedBox(
                        child: BottomBar(
                          child: SelectionButton(
                            // child: SizedBox(),
                            name: "To the top",
                            onTap: _scrollToTop,
                          ),
                        ),
                      )
                    : BottomBar(
                        child: SelectionButton(
                          // child: SizedBox(),
                          name: "To the top",
                          onTap: _scrollToTop,
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
