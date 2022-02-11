import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/MyDynamicHeader.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/OneCard.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TwoCards.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';

class PortfolioB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    void _scrollToTop() {
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 100.w > 767 ? 100 : 60,
              collapsedHeight: 100.w > 767 ? 80 : 65,
              pinned: true,
              leading: Container(),
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: TopNavBar(),
            ),
          ];
        },
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 10,
            //   ),
            // ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: screenSize.width > 1080 ? 10.w : 10,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: OneCard(
                              imageString: 'assets/images/reveuse2.jpeg',
                              heightMultiplicator: 0,
                              galerieName: "Paula",
                              kuenstler: "Charlotte Lobry",
                            ),
                          ),
                        )
                      : OneCard(
                          imageString: 'assets/images/reveuse2.jpeg',
                          heightMultiplicator: 0,
                          galerieName: "Paula",
                          kuenstler: "Charlotte Lobry",
                        ),
                  SizedBox(
                    height: 7.5.w,
                  ),
                  screenSize.width < 700
                      ? SizedBox(
                          child: FittedBox(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TwoCards(
                                firstImageString: 'assets/images/reveuse2.jpeg',
                                firstHeightMultiplicator: 0,
                                secondImageString: 'assets/images/envogue.jpg',
                                secondHeightMultiplicator: 0,
                                firstGalerieName: "Paula",
                                secondGalerieName: "Mathilde",
                              ),
                            ),
                          ),
                        )
                      : TwoCards(
                          firstImageString: 'assets/images/reveuse2.jpeg',
                          firstHeightMultiplicator: 0,
                          secondImageString: 'assets/images/envogue.jpg',
                          secondHeightMultiplicator: 0,
                          firstGalerieName: "Paula",
                          secondGalerieName: "Mathilde",
                        ),
                  SizedBox(
                    height: screenSize.width > 1080 ? 10.w : 10,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: OneCard(
                              imageString: 'assets/images/Mathildedoppelt.jpeg',
                              heightMultiplicator: 0,
                              galerieName: "Mathilde",
                              kuenstler: "Charlotte Lobry",
                            ),
                          ),
                        )
                      : OneCard(
                          imageString: 'assets/images/Mathildedoppelt.jpeg',
                          heightMultiplicator: 0,
                          galerieName: "Mathilde",
                          kuenstler: "Charlotte Lobry",
                        ),
                  SizedBox(
                    height: 7.5.w,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TwoCards(
                              firstImageString: 'assets/images/reveuse2.jpeg',
                              firstHeightMultiplicator: 0,
                              secondImageString: 'assets/images/envogue.jpg',
                              secondHeightMultiplicator: 0,
                              firstGalerieName: "Paula",
                              secondGalerieName: "Mathilde",
                            ),
                          ),
                        )
                      : TwoCards(
                          firstImageString: 'assets/images/reveuse2.jpeg',
                          firstHeightMultiplicator: 0,
                          secondImageString: 'assets/images/envogue.jpg',
                          secondHeightMultiplicator: 0,
                          firstGalerieName: "Paula",
                          secondGalerieName: "Mathilde",
                        ),
                  SizedBox(
                    height: screenSize.width > 1080 ? 10.w : 10,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: OneCard(
                              imageString: 'assets/images/reveuse2.jpeg',
                              heightMultiplicator: 0,
                              galerieName: "Paula",
                              kuenstler: "Charlotte Lobry",
                            ),
                          ),
                        )
                      : OneCard(
                          imageString: 'assets/images/reveuse2.jpeg',
                          heightMultiplicator: 0,
                          galerieName: "Paula",
                          kuenstler: "Charlotte Lobry",
                        ),
                  SizedBox(
                    height: 7.5.w,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TwoCards(
                              firstImageString: 'assets/images/reveuse2.jpeg',
                              firstHeightMultiplicator: 0,
                              secondImageString: 'assets/images/envogue.jpg',
                              secondHeightMultiplicator: 0,
                              firstGalerieName: "Paula",
                              secondGalerieName: "Mathilde",
                            ),
                          ),
                        )
                      : TwoCards(
                          firstImageString: 'assets/images/reveuse2.jpeg',
                          firstHeightMultiplicator: 0,
                          secondImageString: 'assets/images/envogue.jpg',
                          secondHeightMultiplicator: 0,
                          firstGalerieName: "Paula",
                          secondGalerieName: "Mathilde",
                        ),
                  SizedBox(
                    height: screenSize.width > 1080 ? 10.w : 10,
                  ),
                  screenSize.width < 700
                      ? FittedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: OneCard(
                              imageString: 'assets/images/Mathildedoppelt.jpeg',
                              heightMultiplicator: 0,
                              galerieName: "Mathilde",
                              kuenstler: "Charlotte Lobry",
                            ),
                          ),
                        )
                      : OneCard(
                          imageString: 'assets/images/Mathildedoppelt.jpeg',
                          heightMultiplicator: 0,
                          galerieName: "Mathilde",
                          kuenstler: "Charlotte Lobry",
                        ),
                  SizedBox(
                    height: 10.w,
                  ),
                  screenSize.width < 700
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
          ],
        ),
      ),
    );
  }
}
