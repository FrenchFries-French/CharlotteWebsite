// ignore: file_names
import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

//Text(
//                         "I am a photogarpher based between Berlin and Paris. With my photography I want to represent reality through my eyes, which makes it abstract and individual. I want to tell stories and at the same time create room for interpretation, so that stories can be reinvented. Photography is a wonderful means for the purpose to me. I try to make a subjective representation of things into a collective feeling that will hopefully inspire sharing and bringing people together. As the daughter of a Parisian-born father, the energy of the Parisian savoir-vivre has inspired me for as long as I can remember, and much of my photography is inspired by my everyday life in Paris. The experienced in general is probably the biggest source of inspiration, with all its ups and downs.",
//                         style: GoogleFonts.poppins(
//                           fontSize: screenSize.width < 560 ? 14 : 16,
//                           // lets say total width is 400 then 5.w will make font size 20 pixel
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: const TopNavBar(),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width < 560 ? 20 : 50),
                      child: Column(
                        children: [
                          SizedBox(height: 200,),
                          Text(
                            "Paris and Berlin based photographer",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.width < 560 ? 14 : 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Available for booking worldwide",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.width < 560 ? 14 : 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Analogue and digital work",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.width < 560 ? 14 : 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
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
        ));
  }
}
