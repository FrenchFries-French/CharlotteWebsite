import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/LoadMoreWidget.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/ImageCarousel.dart';
import 'package:zoom_widget/zoom_widget.dart';
import '../Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import '../Widgets/HomePageWidgets/ImageCarousel.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatelessWidget {
  // @override
  ScrollController _scrollController = ScrollController();
  Future<void> _scrollToTop() async {
    await _scrollController.animateTo(0,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

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
                screenSize.width < 1080
                    ? Row(
                        children: [
                          Expanded(
                            child: LoadMoreFireStoreWidget(
                              collectionName: "HomePage",
                              initialLimit: 10,
                            ),
                          ),
                        ],
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: LoadMoreFireStoreWidget(
                          collectionName: "HomePage",
                          initialLimit: 10,
                        ),
                      ),
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
