import 'package:charletwebsite/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:charletwebsite/Screens/Kontakt.dart';
import 'package:charletwebsite/Screens/PersonalWork.dart';
import 'package:charletwebsite/Screens/Termsandconditions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/HomePageFirst.dart';
import 'Screens/Commissioned.dart';
import 'Screens/Kontakt.dart';
import 'Screens/PersonalWork.dart';
import 'Screens/About.dart';
import 'Screens/Service.dart';
import 'Screens/Shop.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => MyHomePage(),
          'kontakt': (context) => Kontakt(),
          'personalwork': (context) => PersonalWork(),
          'commissioned': (context) => Commissioned(),
          'about': (context) => About(),
          'service': (context) => Service(),
          'shop': (context) => Shop(),
          'termsandconditions': (context) => Termsandconditions(),
        },
      );
    });
  }
}
