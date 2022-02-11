import 'package:flutter/material.dart';
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverPersistentHeader(
            delegate: MyDynamicHeader(),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 5.w,
            ),
            screenSize.width < 700
                ? FittedBox(
                    child: SizedBox(
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
              height: 5.w,
            ),
            screenSize.width < 700
                ? FittedBox(
                    child: OneCard(
                      imageString: 'assets/images/Mathildedoppelt.jpeg',
                      heightMultiplicator: 0,
                      galerieName: "Mathilde",
                      kuenstler: "Charlotte Lobry",
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
                    child: TwoCards(
                      firstImageString: 'assets/images/reveuse2.jpeg',
                      firstHeightMultiplicator: 0,
                      secondImageString: 'assets/images/envogue.jpg',
                      secondHeightMultiplicator: 0,
                      firstGalerieName: "Paula",
                      secondGalerieName: "Mathilde",
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
              height: 5.w,
            ),
            screenSize.width < 700
                ? FittedBox(
                    child: OneCard(
                      imageString: 'assets/images/reveuse2.jpeg',
                      heightMultiplicator: 0,
                      galerieName: "Paula",
                      kuenstler: "Charlotte Lobry",
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
                    child: TwoCards(
                      firstImageString: 'assets/images/reveuse2.jpeg',
                      firstHeightMultiplicator: 0,
                      secondImageString: 'assets/images/envogue.jpg',
                      secondHeightMultiplicator: 0,
                      firstGalerieName: "Paula",
                      secondGalerieName: "Mathilde",
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
              height: 5.w,
            ),
            screenSize.width < 700
                ? FittedBox(
                    child: OneCard(
                      imageString: 'assets/images/Mathildedoppelt.jpeg',
                      heightMultiplicator: 0,
                      galerieName: "Mathilde",
                      kuenstler: "Charlotte Lobry",
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
          ])),
        ],
      ),
    );
  }
}
