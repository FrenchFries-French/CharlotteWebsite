import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/ShopImages/ReveuseShop.dart';
import 'package:charletwebsite/Widgets/ShopWidgets/ShopCard.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            delegate: MyDynamicHeader(),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      ShopCard(
                        imageString: 'assets/images/reveuse2.jpeg',
                        imageHeight: 0.5,
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ReveuseShop(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                      ),
                      ShopCard(
                        imageString: 'assets/images/envogue.jpg',
                        imageHeight: 0.75,
                        onTap: () {},
                      ),
                      ShopCard(
                        imageString: 'assets/images/Mathildedoppelt.jpeg',
                        imageHeight: 0.5,
                        onTap: () {},
                      ),
                      ShopCard(
                        imageString: 'assets/images/bearb2.jpeg',
                        imageHeight: 0.75,
                        onTap: () {},
                      ),
                      BottomBar(child: const SizedBox()),
                    ]),
              )
            ],
          ))
        ]));
  }
}
