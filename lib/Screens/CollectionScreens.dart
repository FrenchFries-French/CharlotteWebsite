import 'package:cached_network_image/cached_network_image.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/ImageCarousel.dart';
import 'package:charletwebsite/utils/responsiveness.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CollectionScreen extends StatefulWidget {
  CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  Future<void> _scrollToTop() async {
    await _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    const defaultPadding = 16.0;
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
            flexibleSpace: const TopNavBar(),
          ),
        ],
        // controller: _scrollController,
        body: SingleChildScrollView(
          child: SizedBox(
            // width: screenSize.width,
            // height: screenSize.height,
            child: (!Responsive.isDesktop(context))
                ? Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      Text('Mobile Display')
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // LeftColumn Stream
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.black, width: 2)),
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: FirebaseFirestore.instance
                                      .collection("LeftColumn")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    }
                                    if (snapshot.data!.docs.isEmpty) {
                                      return const Text("No Data Exists");
                                    }
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (screenSize.width < 1080) ...[
                                          for (var item in snapshot.data!.docs)
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 14, top: 14),
                                                width: screenSize.width > 767
                                                    ? 22.w
                                                    : 46.w,
                                                height: 60.h,
                                                color: Colors.yellow,
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        item.data()['link']))
                                        ],
                                        if (screenSize.width > 1080) ...[
                                          StaggeredGrid.count(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                            children: [
                                              for (var item
                                                  in snapshot.data!.docs)
                                                // Container(),
                                                StaggeredGridTile.count(
                                                  crossAxisCellCount: 1,
                                                  mainAxisCellCount:
                                                      item.data()['height'] ??
                                                          1,
                                                  child: Container(
                                                    // margin: const EdgeInsets.only(
                                                    //     left: 14, top: 14),
                                                    // width: 100.w > 1200
                                                    //     ? 14.w
                                                    //     : 100.w > 767
                                                    //         ? 22.w
                                                    //         : 46.w,
                                                    // height: 60.h,
                                                    // color: Colors.yellow,
                                                    child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: item
                                                            .data()['link']),
                                                  ),
                                                ),
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
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.black, width: 2)),
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: FirebaseFirestore.instance
                                      .collection("RightColumn")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    }
                                    if (snapshot.data!.docs.isEmpty) {
                                      return const Text("No Data Exists");
                                    }
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (screenSize.width < 1080) ...[
                                          for (var item in snapshot.data!.docs)
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 14, top: 14),
                                                width: screenSize.width > 767
                                                    ? 22.w
                                                    : 46.w,
                                                height: 60.h,
                                                color: Colors.yellow,
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        item.data()['link']))
                                        ],
                                        // if (screenSize.width > 1080) ...[
                                        if (screenSize.width > 1080) ...[
                                          StaggeredGrid.count(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                            children: [
                                              for (var item
                                                  in snapshot.data!.docs)
                                                // Container(),
                                                StaggeredGridTile.count(
                                                  crossAxisCellCount: 1,
                                                  mainAxisCellCount:
                                                      item.data()['height'] ??
                                                          1,
                                                  child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          item.data()['link']),
                                                ),
                                            ],
                                          ),
                                          // Wrap(
                                          //   // spacing: 3.w,
                                          //   // runSpacing: 2.w,
                                          //   alignment: WrapAlignment.start,
                                          //   children: [
                                          //     for (var item in snapshot.data!.docs)
                                          //       Container(
                                          //         margin: const EdgeInsets.only(
                                          //             left: 14, top: 14),
                                          //         // width: 100.w > 1200
                                          //         //     ? 14.w
                                          //         //     : 100.w > 767
                                          //         //         ? 22.w
                                          //         //         : 46.w,
                                          //         height: 60.h,
                                          //         color: Colors.yellow,
                                          //         child: CachedNetworkImage(
                                          //             fit: BoxFit.cover,
                                          //             imageUrl: item.data()['link']),
                                          //       )
                                          //   ],
                                          // ),
                                        ],
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ],
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
                      const SizedBox(
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
