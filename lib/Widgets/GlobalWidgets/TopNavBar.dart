import 'package:charletwebsite/Screens/CollectionScreens.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/sampleCollection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/About.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:charletwebsite/Screens/Service.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/DropdownPersonal.dart';
import '../../Screens/HomePageFirst.dart';
import 'Collection.dart';
import 'DropdownPersonal.dart';
import 'SelectionButton.dart';
import '../../utils/responsiveness.dart';
// import 'package:sizer/sizer.dart';
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
    double w = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    if (screenSize.width > 667)
                      SizedBox(
                        width: screenSize.width < 667
                            ? screenSize.width * 0.3
                            : screenSize.width * 0.3,
                        // height: 0.05 * w,
                        child: Center(
                          child: Image(
                            image: const AssetImage(
                                "assets/images/Charlotte_Logo.png"),
                            height: 5.h,
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: screenSize.width < 667
                            ? screenSize.width * 0.3
                            : screenSize.width * 0.3,
                        // height: 0.05 * w,
                        child: Center(
                          child: Image(
                            /// Please add  logo here for small screen here
                            image: const AssetImage(
                                "assets/images/Charlotte_Logo.png"),
                            height: 5.h,
                          ),
                        ),
                      ),
                    if (screenSize.width < 667)
                      SizedBox(
                        child: FittedBox(
                          child: SelectionButton(
                            name: "Collection",
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          Collection(),
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: screenSize.width < 676 ? 30 : 0.12 * w,
                        child: SelectionButton(
                          name: "Collection",
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        SampleCollection(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          },
                        ),
                      ),
                    if (screenSize.width < 667)
                      SizedBox(
                        child: FittedBox(
                          child: SelectionButton(
                            name: "Series",
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1,
                                          animation2) =>
                                      MyHomePage(), //This has to be changed to MyHomePage(),
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: screenSize.width < 676 ? 30 : 0.12 * w,
                        child: SelectionButton(
                          name: "Portfolio",
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1,
                                        animation2) =>
                                    MyHomePage(), //This has to be changed to MyHomePage(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          },
                        ),
                      ),
                    if (screenSize.width < 667)
                      SizedBox(
                        child: FittedBox(
                          child: SelectionButton(
                              name: "Contact",
                              // child: SizedBox(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Kontakt(),
                                    transitionDuration:
                                        const Duration(seconds: 0),
                                  ),
                                );
                              }),
                        ),
                      )
                    else
                      SizedBox(
                        width: screenSize.width < 676 ? 30 : 0.12 * w,
                        child: SelectionButton(
                            name: "Contact",
                            // child: SizedBox(),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          const Kontakt(),
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                              );
                            }),
                      ),
                    if (screenSize.width < 667)
                      SizedBox(
                        child: FittedBox(
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
                                    transitionDuration:
                                        const Duration(seconds: 0),
                                  ),
                                );
                              }),
                        ),
                      )
                    else
                      SizedBox(
                        width: screenSize.width < 676 ? 30 : 0.12 * w,
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
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                              );
                            }),
                      ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(bottom: 0),
            margin: EdgeInsets.only(bottom: 0),
            child: const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
