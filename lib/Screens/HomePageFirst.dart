import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/Citation.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/ImageCarousel.dart';
import '../Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import '../Widgets/HomePageWidgets/ImageCarousel.dart';
import '../Widgets/GlobalWidgets/OneCard.dart';
import '../Widgets/GlobalWidgets/TwoCards.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatelessWidget {
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
            child: ImageCarousel(),
          ), // AUTOPLAY MUSS ANGESTELLT WERDEN
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
                  ), // TODO 3: Funktionen zu den Buttons müssen hinzufügt werden
          ])),
        ],
      ),
    );
  }
}

/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
          children: [
            CustomScrollView (
            slivers: [
              // HomePageImage(), //wurde durch ImageCarousel() ersetzt
              /*SliverAppBar(
                expandedHeight: screenSize.height * 0.9,
                backgroundColor: Colors.white.withOpacity(1),
                flexibleSpace: ImageCarousel(), // AUTOPLAY MUSS ANGESTELLT WERDEN,
                ),*/
              /*SliverPersistentHeader(
                delegate: MyDynamicHeader(),
              ),*/
              SliverList(delegate: SliverChildListDelegate([
                ImageCarousel(), // AUTOPLAY MUSS ANGESTELLT WERDEN
                Expanded(
                  child: Container(

                    child: Row(
                      // Die Row mache ich nur hin, damit ich die Seite zentrieren kann. Wenn alles nach links soll, dann einfach Row entfernen
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TopNavBar(),
                      ],
                    ),
                  ),
                ), //TopNavBar // TODO 1: DropDownButton muss noch erstellt werden // TODO 2: Funktionen zu den Buttons müssen hinzufügt werden
                OneCard(imageString: 'assets/images/reveuse2.jpeg', heightMultiplicator: 0.65,),
                SizedBox(height: 20,),
                TwoCards(firstImageString: 'assets/images/reveuse2.jpeg', firstheightMultiplicator: 0.45, secondImageString: 'assets/images/envogue.jpg',
                secondheightMultiplicator: 0.6,),
                SizedBox(height: 20,),
                OneCard(imageString: 'assets/images/Mathildedoppelt.jpeg', heightMultiplicator: 0.65,),
                SizedBox(height: 30,),
                BottomBar(), // TODO 3: Funktionen zu den Buttons müssen hinzufügt werden
              ]))
            ],
          ),
        ]),
      );
  }
}


class MyDynamicHeader extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ImageCarousel();
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 650.0;

  @override
  double get minExtent => 0.0;
}
*/

/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Container(
        child: ListView(
          children: [
            ImageCarousel(), // AUTOPLAY MUSS ANGESTELLT WERDEN
                Expanded(
                  child: Container(

                    child: Row(
                      // Die Row mache ich nur hin, damit ich die Seite zentrieren kann. Wenn alles nach links soll, dann einfach Row entfernen
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TopNavBar(),
                      ],
                    ),
                  ),
                ), //TopNavBar // TODO 1: DropDownButton muss noch besser gemacht werden // TODO 2: Funktionen zu den Buttons müssen hinzufügt werden
                OneCard(imageString: 'assets/images/reveuse2.jpeg', heightMultiplicator: 0.65, galerieName: "Paula",),
                SizedBox(height: 20,),
                TwoCards(firstImageString: 'assets/images/reveuse2.jpeg', firstHeightMultiplicator: 0.45, secondImageString: 'assets/images/envogue.jpg',
                secondHeightMultiplicator: 0.6, firstGalerieName: "Paula", secondGalerieName: "Mathilde",),
                SizedBox(height: 20,),
                OneCard(imageString: 'assets/images/Mathildedoppelt.jpeg', heightMultiplicator: 0.65, galerieName: "Mathilde",),
            SizedBox(height: 20,),
            TwoCards(firstImageString: 'assets/images/reveuse2.jpeg', firstHeightMultiplicator: 0.45, secondImageString: 'assets/images/envogue.jpg',
              secondHeightMultiplicator: 0.6, firstGalerieName: "Paula", secondGalerieName: "Mathilde",),
            SizedBox(height: 30,),
            OneCard(imageString: 'assets/images/reveuse2.jpeg', heightMultiplicator: 0.65, galerieName: "Paula",),
            SizedBox(height: 20,),
            TwoCards(firstImageString: 'assets/images/reveuse2.jpeg', firstHeightMultiplicator: 0.45, secondImageString: 'assets/images/envogue.jpg',
              secondHeightMultiplicator: 0.6, firstGalerieName: "Paula", secondGalerieName: "Mathilde",),
            SizedBox(height: 20,),
            OneCard(imageString: 'assets/images/Mathildedoppelt.jpeg', heightMultiplicator: 0.65, galerieName: "Mathilde",),
            SizedBox(height: 30,),
            BottomBar(), // TODO 3: Funktionen zu den Buttons müssen hinzufügt werden

          ],
        ),
      ),
    );
  }
}
 */
