import 'package:charletwebsite/Screens/PhotoGallery.dart';
import 'package:charletwebsite/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:charletwebsite/Screens/PersonalWork.dart';
import 'package:charletwebsite/Screens/Termsandconditions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'Screens/HomePageFirst.dart';
import 'Screens/Commissioned.dart';
import 'Screens/Kontakt.dart';
import 'Screens/PersonalWork.dart';
import 'Screens/About.dart';
import 'Screens/Service.dart';
import 'Screens/Shop.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Widgets/GlobalWidgets/Collection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Charlotte Lobry',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          //primarySwatch: Colors.white,
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => MyHomePage(),
          'kontakt': (context) => const Kontakt(),
          'personalwork': (context) => const PersonalWork(),
          'commissioned': (context) => const Commissioned(),
          'about': (context) => const About(),
          'service': (context) => const Service(),
          'shop': (context) => const Shop(),
          'termsandconditions': (context) => const Termsandconditions(),
          'collection': (context) => Collection()
        },
      );
    });
  }
}
