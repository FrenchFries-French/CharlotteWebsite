import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/LoadMoreWidget.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/ImageCarousel.dart';
import 'TopNavBar.dart';
import 'BottomNavBar.dart';
import 'package:sizer/sizer.dart';

/// This [Screen] represents the album based on the [query] we pass in [constructor]
///
/// You need to specify if you want to show [Text] After [Image] or not
///
/// FOr example normally you would see gallery name for the [object] coming from database.
///
/// Here by setting property of [showGalleryText] to false to hide text after [Image]

class FotoPage extends StatelessWidget {
  final String albumName;
  final bool showGalleryText;
  FotoPage({
    required this.albumName,
    required this.showGalleryText,
  });
  @override
  ScrollController _scrollController = ScrollController();
  Future<void> _scrollToTop() async {
    await _scrollController.animateTo(0,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        // scrollBehavior: MaterialScrollBehavior(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 100.w > 767 ? 140 : 65,
            collapsedHeight: 100.w > 767 ? 80 : 65,
            pinned: true,
            elevation: 0,
            leading: Container(),
            backgroundColor: Colors.white,
            flexibleSpace: TopNavBar(),
          ),
        ],
        // controller: _scrollController,
        body: SingleChildScrollView(
          child: Column(
            children: [
              screenSize.width < 1080
                  ? FittedBox(
                      child: LoadMoreFireStoreWidget(
                        collectionName: this.albumName,
                        //  "Urban",
                        initialLimit: 10,
                        showGalleryText: this.showGalleryText,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: LoadMoreFireStoreWidget(
                        collectionName: this.albumName
                        // "Urban"
                        ,
                        showGalleryText: this.showGalleryText,
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
    );
  }
}
