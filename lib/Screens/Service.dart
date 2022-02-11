import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/ServiceWidgets/bullet_point_service.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Service extends StatelessWidget {


  launchEmail()  {
    final url = 'mailto:tom.lobry@gmail.com';
    launch(url);
  }

  launchPhone()  {
    final url = 'tel:+4917663248505';
    launch(url);
  }

  launchInstagram() {
    var url = 'https://www.instagram.com/charlottelob/?hl=de';
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
              SizedBox(height: 5.h),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 30.w,),
                      Container(
                        width: 67.w,
                        //color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Photography', style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.bold),),
                            SizedBox(height: 1.h,),
                            Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.', style: TextStyle(fontSize: 2.w),),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Corporate Photography',),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Produktphotographie'),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Areal Photography'),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Retouching'),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'People Photography'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(width: 10.w,
                          height: 10.w,
                          color: Colors.black,),
                          Container(width: 8.w,
                            height: 8.w,
                            color: Colors.white,),
                          Container(width: 1.w,
                            height: 11.w,
                            color: Colors.white,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      SizedBox(width: 57.w,),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(width: 10.w,
                            height: 10.w,
                            color: Colors.black,),
                          Container(width: 8.w,
                            height: 8.w,
                            color: Colors.white,),
                          Container(width: 11.w,
                            height: 1.w,
                            color: Colors.white,),
                        ],
                      ),
                      SizedBox(width: 33.w,),
                      Container(
                        width: 67.w,
                        //color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Film', style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.bold), textAlign: TextAlign.end,),
                            SizedBox(height: 1.h,),
                            Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.', style: TextStyle(fontSize: 2.w),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Director of Photography' ),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Film Production'),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Schnitt und Colorist'),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Editor'),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      SizedBox(width: 30.w,),
                      Container(
                        width: 67.w,
                        //color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Concept Development', style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.bold),),
                            SizedBox(height: 1.h,),
                            Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.', style: TextStyle(fontSize: 2.w),),
                            SizedBox(height: 1.h,),
                            BulletPointService(text: 'Creative direction for photo and film'),
                            SizedBox(height: 5.h,),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(width: 10.w,
                            height: 10.w,
                            color: Colors.black,),
                          Container(width: 8.w,
                            height: 8.w,
                            color: Colors.white,),
                          Container(width: 1.w,
                            height: 11.w,
                            color: Colors.white,),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 1.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){launchPhone();}, icon: FaIcon(FontAwesomeIcons.phone),),
                      SizedBox(width: 3.w,),
                      IconButton( onPressed: () => {launchEmail()}, icon: Icon(Icons.mail), iconSize: 30,),
                      SizedBox(width: 3.w,),
                      IconButton( onPressed: () => {launchInstagram()}, icon: FaIcon(FontAwesomeIcons.instagram), iconSize: 30,),
                    ],
                  ),

                ],
              ),

              SizedBox(height: 3.h,),
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


