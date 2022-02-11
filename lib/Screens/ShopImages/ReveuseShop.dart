import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:flutter_app/Widgets/GlobalWidgets/MyDynamicHeader.dart';


class ReveuseShop extends StatelessWidget {


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
              Container(color: Colors.white, height: screenSize.height*0.7,),
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


