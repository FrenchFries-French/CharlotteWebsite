import 'package:flutter/material.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MyDynamicHeader(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                height: screenSize.height * 0.7,
                child: Column(


                  children: [
                    Text(
                      "Webseitenbetreiber",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        fontWeight: FontWeight.bold
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Charlotte Lobry",
                      style: GoogleFonts.poppins(
                          fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50,),
                    Text(
                      "Informationen über das Unternehmen",
                      style: GoogleFonts.poppins(
                          fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                          fontWeight: FontWeight.bold
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Freiberufler",
                      style: GoogleFonts.poppins(
                          fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Steinstraße 9",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Berlin, 10119",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "info@charlottelobry.com",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "+176 63248505",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.width > 1080 ? 1.w : 3.w,
                        // lets say total width is 400 then 5.w will make font size 20 pixel
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              const BottomBar(
                child: SizedBox(),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
