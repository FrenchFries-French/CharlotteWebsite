
import 'package:flutter/material.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
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
              Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    color: Colors.white,
                    width: 90.w,
                    height: 40.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                          'Buhm and Chlotti is a creative duo that offers photography, film and creative concept development. We aim to create appealing and engaging visual communication - both as a hollistic concept and as a bookable individual service. Creating emotions and putting moments in one or more frames is our speciality.',
                          style: GoogleFonts.signikaNegative(fontSize: 4.w)),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Container(
                    width: 50.w,
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 25.h,
                            child: Image.asset('assets/images/envogue.jpg')),
                        SizedBox(width: 2.h,),
                        Container(
                            height: 25.h,
                            child: Image.asset('assets/images/envogue.jpg')),
                      ],
                    ),
                  )
                ],
              ),
              BottomBar(
                child: SizedBox(),
              ), // TODO 3: Funktionen zu den Buttons müssen hinzufügt werden
            ]),
          )
        ],
      ),
    );
  }
}
