import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/About.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:charletwebsite/Screens/Service.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/DropdownPersonal.dart';
import '../../Screens/HomePageFirst.dart';
import 'DropdownPersonal.dart';
import 'SelectionButton.dart';
import 'package:sizer/sizer.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future:
                FirebaseFirestore.instance.collection("dropDownNames").get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<String> dynamicList = ["AllAlbums"];

                if (snapshot.data!.docs.isNotEmpty) {
                  for (var element in List<String>.from(
                      snapshot.data!.docs[0].data()['names'])) {
                    dynamicList.add(element);
                  }
                }
                return Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 5.w,
                        child: Center(
                            child: Text(
                          "Charlotte Lobry",
                          style: TextStyle(
                              fontSize: 2.5.w, fontWeight: FontWeight.bold),
                        ))),
                    SizedBox(
                      width: 15.w,
                      child: SelectionButton(
                        name: "Home",
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  MyHomePage(), //This has to be changed to MyHomePage(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                      child: DDPersonal(dynamicList: dynamicList),
                    ),

                    /**
                * The following assertion was thrown while applying parent data.:
                  Incorrect use of ParentDataWidget.
                  The ParentDataWidget Expanded(flex: 1) wants to apply ParentData of type FlexParentData to a RenderObject,
                  which has been set up to accept ParentData of incompatible type ParentData.
                  Usually, this means that the Expanded widget has the wrong ancestor RenderObjectWidget.
                  Typically, Expanded widgets are placed directly inside Flex widgets.

                 */
                    SizedBox(
                      // width: 12.w,
                      width:
                          MediaQuery.of(context).size.width > 480 ? 12.w : 13.w,
                      child: SelectionButton(
                          name: "Service",
                          // child: Container(),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const Service(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      // width: 12.w,
                      // width: MediaQuery.of(context).size.width > 480 ? 12.w : 13.w,
                      child: SelectionButton(
                          name: "Kontakt",
                          // child: SizedBox(),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const Kontakt(),
                                transitionDuration: const Duration(seconds: 0),
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
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const About(),
                                transitionDuration: const Duration(seconds: 0),
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
                );
              } else {
                return Container();
              }
            },
          ),
          Container(
            width: 1000.w,
            // height: 0.1.h,
            child: Divider(
              // height: 10,
              thickness: 1,
              indent: MediaQuery.of(context).size.width > 480 ? 95 : 15,
              endIndent: MediaQuery.of(context).size.width > 480 ? 130 : 20,
              color: Colors.black,
            ),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
