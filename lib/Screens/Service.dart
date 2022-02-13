import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/TopNavBar.dart';
import 'package:charletwebsite/Widgets/ServiceWidgets/bullet_point_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Service extends StatelessWidget {
  const Service({Key? key}) : super(key: key);

  launchEmail() {
    const url = 'mailto:info@never-seen.de';
    launch(url);
  }

  launchPhone() {
    const url = 'tel:+4917663248505';
    launch(url);
  }

  launchInstagram() {
    var url = 'https://www.instagram.com/';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: const TopNavBar(),
      ),
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenSize.width > 400 ? 10 : 6.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: screenSize.width > 767 ? 67.w : 50.w,
                              //color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Photography',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    'Pictures are full of emotions and convey ideas and messages. To realize these, we rely on conceptual photography as well as representational photography in digital as in analogue form. We create unique and authentic image worlds which tell stories, capture moments and aims to make the consumer feel positive. It is important to us to take the brand values into account and to help to create or strengthen the brand identity in the process of conceptualisation, the direct implementation and the post-production.Therefore we aim to create a binding customer experience and bring the visual content of the brand as close as possible to the customer.',
                                    style: TextStyle(
                                      fontSize:
                                          screenSize.width > 767 ? 2.w : 3.w,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                    text: 'Corporate Photography',
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                    text: 'Product Photographie',
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text: 'Areal Photography'),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(text: 'Retouching'),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text: 'People Photography'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: 10.w,
                                  height: 10.w,
                                  color: Colors.black,
                                ),
                                Container(
                                  width: 8.w,
                                  height: 8.w,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 1.w,
                                  height: 11.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.width > 767 ? 6.h : 3.h,
                        ),
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(flex: 2),
                            SizedBox(
                              width: 30.w,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 10.w,
                                        height: 10.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        width: 11.w,
                                        height: 1.w,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 10.w,
                            // ),
                            const Spacer(),
                            SizedBox(
                              // width: 67.w,
                              width: screenSize.width > 767 ? 67.w : 50.w,
                              //color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Film',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "We design immersive moving image experiences that go beyond classic standards. We tell stories - your story. By orchestrating the narrative and its protagonists in the right way, we create sustainable, valuable content and campaigns that awaken emotions in consumers. A dynamic moving image appeals to two senses at the same time and creates an auditory as well as a visual experience that remains unforgettable. With the support of suitable imagery, we catch the recipient. With great sensitivity, we create visual content you've never seen. Because that's what our passion is.",
                                    style: TextStyle(
                                      fontSize:
                                          screenSize.width > 767 ? 2.w : 3.w,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text: 'Director of Photography'),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text: 'Film Production'),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text: 'Schnitt und Colorist'),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(text: 'Editor'),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.width > 767 ? 6.h : 3.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: screenSize.width > 767 ? 67.w : 50.w,
                              //color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Concept Development',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "We not only implement ideas and concepts, we also create them ourselves. With a team of make-up and hair artists, stylists and set designers, we ensure that every concept is realized as it should be. We can support you with the conceptualisation or we can take over this task completely. In the end what matters the most to us is creating imageries that show the world your uniqueness.",
                                    style: TextStyle(
                                      fontSize:
                                          screenSize.width > 767 ? 2.w : 3.w,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const BulletPointService(
                                      text:
                                          'Creative direction for photo and film'),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: 10.w,
                                  height: 10.w,
                                  color: Colors.black,
                                ),
                                Container(
                                  width: 8.w,
                                  height: 8.w,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 1.w,
                                  height: 11.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.width > 767 ? 6.h : 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                launchPhone();
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.phone,
                                size: screenSize.width > 545 ? 30 : 20,
                              ),
                              iconSize: screenSize.width > 545 ? 30 : 20,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            IconButton(
                              onPressed: () => {launchEmail()},
                              icon: const Icon(Icons.mail),
                              iconSize: screenSize.width > 545 ? 30 : 20,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            IconButton(
                              onPressed: () => {launchInstagram()},
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                              iconSize: screenSize.width > 545 ? 30 : 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.width > 767 ? 6.h : 3.h,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              )
                      ],
                    ),
                    // LoadMoreListView(), //
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: screenSize.width > 1080 ? Container() : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
