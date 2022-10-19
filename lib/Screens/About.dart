// ignore: file_names
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
        preferredSize: Size(screenSize.width, 60),
        child: const TopNavBar(),
      ),
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // direction: Axis.vertical,
                  children: [
                    SizedBox(height: 10.h,),
                    Container(
                      // alignment: AlignmentDirectional.center,
                      color: Colors.white,
                      width: 100.w > 700 ? 60.w : 80.w,
                      padding: const EdgeInsets.all(10),
                      // height: 40.h,
                      child: Column(
                        children: [
                          Text(
                            "I am a photogarpher based between Berlin and Paris. With my photography I want to represent reality through my eyes, which makes it abstract and individual. I want to tell stories and at the same time create room for interpretation, so that stories can be reinvented. Photography is a wonderful means for the purpose to me. I try to make a subjective representation of things into a collective feeling that will hopefully inspire sharing and bringing people together. As the daughter of a Parisian-born father, the energy of the Parisian savoir-vivre has inspired me for as long as I can remember, and much of my photography is inspired by my everyday life in Paris. The experienced in general is probably the biggest source of inspiration, with all its ups and downs.",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.width < 560 ? 14 : 16,
                              // lets say total width is 400 then 5.w will make font size 20 pixel
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 22.w,
                    ),
                    /*Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // direction: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: screenSize.width > 767
                              ? screenSize.width * 0.2
                              : screenSize.width * 0.4,
                          child: Image.asset(
                            'assets/images/Charlotte_About.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),*/
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
                        : Align(
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
