import 'package:flutter/material.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:flutter_app/Widgets/GlobalWidgets/SelectionButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class Kontakt extends StatelessWidget {

  launchEmail()  {
    final url = 'mailto:tom.müller@gmail.com';
      launch(url);
  }

  launchPhone()  {
    final url = 'tel:+4917663243212';
    launch(url);
  }

  launchInstagram() {
    var url = 'https://www.instagram.com/test/?hl=de';
    launch(url);
  }


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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenSize.height*0.2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 100,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(//height: screenSize.height*0.2,
                                width: screenSize.width*0.2,),
                              Text("Charlotte Müller"),
                              SizedBox(height: 8,),
                              Text("Björn Müller")],
                          ),
                        ),
                        Stack(
                            alignment: AlignmentDirectional.center,
                            children: [Container(
                              color: Colors.black,
                              height: 10.w,
                              width: 10.w,
                            ),
                              Container(
                                color: Colors.white,
                                height: 11.w,
                                width: 0.5.w,
                              ),
                            ]
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(//height: screenSize.height*0.2,
                                  width: screenSize.width*0.2,),
                                TextButton(child: Text("buhm@buhm-agency.com", style: TextStyle(color: Colors.black),), onPressed: () => {launchEmail()},),
                                TextButton(child: Text("Instagram", style: TextStyle(color: Colors.black),), onPressed: (){launchInstagram();},),
                              ]),
                        ),
                        SizedBox(width: 100,),
                      ],
                    ),
                    SizedBox(height: screenSize.height*0.25,),
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
                                child: Text("BUHM AGENCY"),
                              ),
                              Text("Müllerstraße 9"),
                              Text("12453 München"),
                              Text("Germany"),
                                  TextButton(child: Text("+49 176 64248505", style: TextStyle(color: Colors.black),), onPressed: () => {launchPhone()},),
                                  SizedBox(height: 30,)
                        ])),
                      ],
                    ),
                  ],
                ),
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


