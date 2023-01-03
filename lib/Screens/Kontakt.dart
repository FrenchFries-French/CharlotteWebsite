import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class Kontakt extends StatelessWidget {
  const Kontakt({Key? key}) : super(key: key);

  launchEmail() async {
    const url = 'mailto:info@charlottelobry.com';
    launch(url);
  }

  launchPhone() {
    const url = 'tel:+4917681126474';
    launch(url);
  }

  launchInstagram() {
    var url = 'https://www.instagram.com/charlottelobry/';
    launch(url);
  }

  TextStyle _responsiveTextStyle({required Size size}) {
    return TextStyle(
      color: Colors.black,
      fontSize: size.width < 480
          ? 12
          : size.width < 360
              ? 10
              : 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: const TopNavBar(),
        ),
        backgroundColor: Colors.white,
        body: screenSize.width < 800
            ? SizedBox(
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      "Charlotte Lobry",
                      style: _responsiveTextStyle(
                        size: screenSize,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Fashion Photgrapher",
                      style: _responsiveTextStyle(
                        size: screenSize,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenSize.width > 767 ? 10.w : 10.h,
                          width: screenSize.width > 767 ? 5.w : 20,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width > 767 ? 5 : 2),
                        ),
                        Container(
                          height: screenSize.width > 767 ? 10.w : 10.h,
                          width: screenSize.width > 767 ? 5.w : 20,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width > 767 ? 5 : 2),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: Text(
                        "info@charlottelobry.com",
                        style: _responsiveTextStyle(size: screenSize),
                        textAlign: TextAlign.end,
                      ),
                      onTap: () => {launchEmail()},
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      child: Text("Instagram",
                          textAlign: screenSize.width > 767
                              ? TextAlign.end
                              : TextAlign.end,
                          style: _responsiveTextStyle(
                            size: screenSize,
                          )),
                      onTap: () {
                        launchInstagram();
                      },
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Paris and Berlin based photographer ",
                            style: _responsiveTextStyle(size: screenSize),
                          ),
                          Text(
                            "Available for booking worldwide",
                            // style: TextStyle(
                            //   fontSize: screenSize.width < 700 ? 10 : 14,
                            // ),
                            style: _responsiveTextStyle(size: screenSize),
                          ),
                          Text(
                            "Analogue and digital work",
                            // style: TextStyle(
                            //   fontSize: screenSize.width < 700 ? 10 : 14,
                            // ),
                            style: _responsiveTextStyle(size: screenSize),
                          ),
                          /*Text(
                              "And I will try my best to help you",
                              // style: TextStyle(
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),*/
                          /*TextButton(
                            child: Text(
                              "info@charlottelobry.com",
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),
                            onPressed: () => {launchEmail()},
                          ),*/
                          const SizedBox(
                            height: 55,
                          ),
                          // BottomBar(child: SizedBox()),
                        ]),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FittedBox(
                            child: BottomBar(
                              child: SizedBox(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Charlotte Lobry",
                              style: _responsiveTextStyle(
                                size: screenSize,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Fashion Photgrapher",
                              style: _responsiveTextStyle(
                                size: screenSize,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Row(
                          children: [
                            Container(
                              height: screenSize.width > 767 ? 10.w : 10.h,
                              width: screenSize.width > 767 ? 5.w : 20,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenSize.width > 767 ? 5 : 2),
                            ),
                            Container(
                              height: screenSize.width > 767 ? 10.w : 10.h,
                              width: screenSize.width > 767 ? 5.w : 20,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenSize.width > 767 ? 5 : 2),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 55,
                            ),
                            InkWell(
                              child: Text(
                                "info@charlottelobry.com",
                                style: _responsiveTextStyle(size: screenSize),
                                textAlign: TextAlign.end,
                              ),
                              onTap: () => {launchEmail()},
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            InkWell(
                              child: Text("Instagram",
                                  textAlign: screenSize.width > 767
                                      ? TextAlign.end
                                      : TextAlign.end,
                                  style: _responsiveTextStyle(
                                    size: screenSize,
                                  )),
                              onTap: () {
                                launchInstagram();
                              },
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Paris and Berlin based photographer",
                                style: _responsiveTextStyle(size: screenSize),
                              ),
                              Text(
                                "Available for booking worldwide",
                                // style: TextStyle(
                                //   fontSize: screenSize.width < 700 ? 10 : 14,
                                // ),
                                style: _responsiveTextStyle(size: screenSize),
                              ),
                              Text(
                                "Analogue and digital work",
                                // style: TextStyle(
                                //   fontSize: screenSize.width < 700 ? 10 : 14,
                                // ),
                                style: _responsiveTextStyle(size: screenSize),
                              ),
                              /*Text(
                                  "And I will try my best to help you",
                                  // style: TextStyle(
                                  //   fontSize: screenSize.width < 700 ? 10 : 14,
                                  // ),
                                  style: _responsiveTextStyle(size: screenSize),
                                ),*/
                              /*TextButton(
                                child: Text(
                                  "info@charlottelobry.com",
                                  // style: TextStyle(
                                  //   color: Colors.black,
                                  //   fontSize: screenSize.width < 700 ? 10 : 14,
                                  // ),
                                  style: _responsiveTextStyle(size: screenSize),
                                ),
                                onPressed: () => {launchEmail()},
                              ),*/
                              const SizedBox(
                                height: 55,
                              ),
                              // BottomBar(child: SizedBox()),
                            ]),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FittedBox(
                            child: BottomBar(
                              child: SizedBox(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}
