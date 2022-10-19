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
                  SizedBox(height: 55,),
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
                          "For any purchasing requests ",
                          style: _responsiveTextStyle(size: screenSize),
                        ),
                        Text(
                          "send me an email and I will",
                          // style: TextStyle(
                          //   fontSize: screenSize.width < 700 ? 10 : 14,
                          // ),
                          style: _responsiveTextStyle(size: screenSize),
                        ),
                        Text(
                          "get back to you soon",
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
                        TextButton(
                          child: Text(
                            "info@charlottelobry.com",
                            // style: TextStyle(
                            //   color: Colors.black,
                            //   fontSize: screenSize.width < 700 ? 10 : 14,
                            // ),
                            style: _responsiveTextStyle(size: screenSize),
                          ),
                          onPressed: () => {launchEmail()},
                        ),
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
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    // height: MediaQuery.of(context).size.height * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize.width / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                            minHeight: 30,
                                          ),
                                          width:
                                              screenSize.width > 767 ? 140 : 80,
                                          child: Text(
                                            "Charlotte Lobry",
                                            style: _responsiveTextStyle(
                                              size: screenSize,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Fashion Photgrapher",
                                          style: _responsiveTextStyle(
                                            size: screenSize,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Container(
                                    height:
                                        screenSize.width > 767 ? 10.w : 5.5.h,
                                    width: screenSize.width > 767 ? 5.w : 30,
                                    color: Colors.black,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            screenSize.width > 767 ? 5 : 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        screenSize.width > 767 ? 10.w : 5.5.h,
                                    width: screenSize.width > 767 ? 5.w : 30,
                                    color: Colors.black,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            screenSize.width > 767 ? 5 : 2),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Flex(
                                            direction: Axis.vertical,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              screenSize.width < 767
                                                  ? Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        minHeight: 30,
                                                      ),
                                                      width: 100,
                                                      child: InkWell(
                                                        child: Text(
                                                          "info@charlottelobry.com",
                                                          style:
                                                              _responsiveTextStyle(
                                                                  size:
                                                                      screenSize),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                        onTap: () =>
                                                            {launchEmail()},
                                                      ),
                                                    )
                                                  : Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        minHeight: 30,
                                                      ),
                                                      // width: 100,
                                                      child: InkWell(
                                                        child: Text(
                                                          "info@charlottelobry.com",
                                                          style:
                                                              _responsiveTextStyle(
                                                                  size:
                                                                      screenSize),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                        onTap: () =>
                                                            {launchEmail()},
                                                      ),
                                                    ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 200,
                                                ),
                                                width: 100,
                                                // screenSize.width < 767
                                                //     ? 100
                                                //     : 200,
                                                child: InkWell(
                                                  child: Text("Instagram",
                                                      textAlign:
                                                          screenSize.width > 767
                                                              ? TextAlign.end
                                                              : TextAlign.end,
                                                      style:
                                                          _responsiveTextStyle(
                                                        size: screenSize,
                                                      )),
                                                  onTap: () {
                                                    launchInstagram();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "For any purchasing requests ",
                                    style:
                                        _responsiveTextStyle(size: screenSize),
                                  ),
                                  Text(
                                    "send me an email and I will",
                                    // style: TextStyle(
                                    //   fontSize: screenSize.width < 700 ? 10 : 14,
                                    // ),
                                    style:
                                        _responsiveTextStyle(size: screenSize),
                                  ),
                                  Text(
                                    "get back to you soon",
                                    // style: TextStyle(
                                    //   fontSize: screenSize.width < 700 ? 10 : 14,
                                    // ),
                                    style:
                                        _responsiveTextStyle(size: screenSize),
                                  ),
                                  /*Text(
                              "And I will try my best to help you",
                              // style: TextStyle(
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),*/
                                  TextButton(
                                    child: Text(
                                      "info@charlottelobry.com",
                                      // style: TextStyle(
                                      //   color: Colors.black,
                                      //   fontSize: screenSize.width < 700 ? 10 : 14,
                                      // ),
                                      style: _responsiveTextStyle(
                                          size: screenSize),
                                    ),
                                    onPressed: () => {launchEmail()},
                                  ),
                                ]),
                            // SizedBox(
                            //   width: screenSize.width > 1080 ? 120 : 10,
                            // ),
                          ],
                        ),
                        // Spacer(),
                        screenSize.width > 1080
                            ? Align(
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
                            : Column(
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
                      ],
                    ),
                  ),
                  // Positioned(bottom: 0, child: Container()),
                ],
              ),
            ),
    );
  }
}