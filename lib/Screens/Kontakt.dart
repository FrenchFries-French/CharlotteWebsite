import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class Kontakt extends StatelessWidget {
  const Kontakt({Key? key}) : super(key: key);

  launchEmail() async {
    const url = 'mailto:info@never-seen.de';
    launch(url);
  }

  launchPhone() {
    const url = 'tel:+4917681126474';
    launch(url);
  }

  launchInstagram() {
    var url = 'https://www.instagram.com/';
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
        preferredSize: Size(screenSize.width, 80),
        child: TopNavBar(),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    width: screenSize.width > 767 ? 140 : 80,
                                    child: Text(
                                      "Charlotte Müller",
                                      style: _responsiveTextStyle(
                                        size: screenSize,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Björn Müller",
                                    style: _responsiveTextStyle(
                                      size: screenSize,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Container(
                              height: screenSize.width > 767 ? 10.w : 5.5.h,
                              width: screenSize.width > 767 ? 5.w : 30,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenSize.width > 767 ? 5 : 2),
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
                              height: screenSize.width > 767 ? 10.w : 5.5.h,
                              width: screenSize.width > 767 ? 5.w : 30,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenSize.width > 767 ? 5 : 2),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                                    "info@never-seen.de",
                                                    style: _responsiveTextStyle(
                                                        size: screenSize),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  onTap: () => {launchEmail()},
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
                                                    "info@never-seen.de",
                                                    style: _responsiveTextStyle(
                                                        size: screenSize),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  onTap: () => {launchEmail()},
                                                ),
                                              ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
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
                                                style: _responsiveTextStyle(
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
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Never Seen",
                                style: _responsiveTextStyle(size: screenSize),
                              ),
                            ),
                            Text(
                              "Müllerstraße 9",
                              // style: TextStyle(
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),
                            Text(
                              "12453 München",
                              // style: TextStyle(
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),
                            Text(
                              "Germany",
                              // style: TextStyle(
                              //   fontSize: screenSize.width < 700 ? 10 : 14,
                              // ),
                              style: _responsiveTextStyle(size: screenSize),
                            ),
                            TextButton(
                              child: Text(
                                "+49 176 81126474",
                                // style: TextStyle(
                                //   color: Colors.black,
                                //   fontSize: screenSize.width < 700 ? 10 : 14,
                                // ),
                                style: _responsiveTextStyle(size: screenSize),
                              ),
                              onPressed: () => {launchPhone()},
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ])),
                      // SizedBox(
                      //   width: screenSize.width > 1080 ? 120 : 10,
                      // ),
                    ],
                  ),
                  // Spacer(),
                  screenSize.width > 1080
                      ? Container(
                          color: Colors.white,
                          width: screenSize.width,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BottomBar(
                                    child: const SizedBox(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: BottomBar(
                                child: const SizedBox(),
                              ),
                            ),
                            const SizedBox(
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
