import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charletwebsite/Screens/About.dart';
import 'package:charletwebsite/Screens/HomePageFirst.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:charletwebsite/Screens/Service.dart';
import 'package:charletwebsite/Screens/Shop.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/DropdownPersonal.dart';
import 'package:charletwebsite/Widgets/HomePageWidgets/HomePageImage.dart';
import 'DropdownPersonal.dart';
import 'SelectionButton.dart';
import 'package:sizer/sizer.dart';

//TODO: please make the TopNavBar a bit smaller.

class TopNavBar extends StatefulWidget {
  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  int shopItems = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: [
                Text(
                  "BUHM",
                  style: TextStyle(
                    fontSize: 4.w,
                    color: Colors.black,
                  ),
                ),
                // SizedBox(
                //   width: 1.h,
                // ),
                SizedBox(
                  width: 12.w,
                  child: SelectionButton(
                    name: "Home",
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              MyHomePage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                  child: Expanded(child: DDPersonal()),
                ),
                SizedBox(
                  width: 12.w,
                  child: SelectionButton(
                      name: "Service",
                      // child: Container(),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Service(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: 12.w,
                  child: SelectionButton(
                      name: "Kontakt",
                      // child: SizedBox(),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Kontakt(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                ),
                //DDPersonal(),
                //DDCommissioned(),
                SizedBox(
                  width: 12.w,
                  child: SelectionButton(
                      name: "About",
                      // child: SizedBox(),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                About(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                ),
                /*SizedBox(
                  child: SelectionButton(
                      name: "Shop",
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          Positioned(
                            child: Opacity(
                                opacity: shopItems == 0 ? 0 : 1,
                                child: Text(
                                  "$shopItems",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                            left: 18,
                            top: 16,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Shop(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                ),*/
              ],
            ),
          ),
          Container(
            width: 100.w,
            height: 1.h,
            child: Divider(
              // height: 10,
              thickness: 1,
              indent: 15,
              endIndent: 15,
              color: Colors.black,
            ),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
