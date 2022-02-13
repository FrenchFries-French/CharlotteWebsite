import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: TopNavBar(),
      ),
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.95,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // direction: Axis.vertical,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // alignment: AlignmentDirectional.center,
                          color: Colors.white,
                          width: 100.w > 700 ? 60.w : 80.w,
                          padding: const EdgeInsets.all(10),
                          // height: 40.h,
                          child: Text(
                            'Charlotte and Björn is a creative duo that offers photography, film and creative concept development. We aim to create appealing and engaging visual communication - both as a hollistic concept and as a bookable individual service. Creating emotions and putting moments in one or more frames is our speciality.',
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.width > 1080 ? 2.5.w : 4.w,
                              // lets say total width is 400 then 5.w will make font size 20 pixel
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // direction: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: screenSize.width > 767
                                ? screenSize.width * 0.2
                                : screenSize.width * 0.35,
                            child: Image.asset(
                              'assets/images/Charlotte_About.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: screenSize.width > 767 ? 40 : 20,
                            ),
                            width: screenSize.width > 767
                                ? screenSize.width * 0.2
                                : screenSize.width * 0.35,
                            child: Image.asset(
                              'assets/images/Bjorn_About_zu.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      // Spacer(),
                      const SizedBox(
                        height: 20,
                      ),
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
                                    children: const [
                                      BottomBar(
                                        child: SizedBox(),
                                      ),
                                      SizedBox(
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
                                  child: const BottomBar(
                                    child: SizedBox(),
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
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child:
            // ),
          ],
        ),
      ),
    );
  }
}
