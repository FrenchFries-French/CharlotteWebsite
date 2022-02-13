import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/BottomNavBar.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/MyDynamicHeader.dart';

class ReveuseShop extends StatelessWidget {
  const ReveuseShop({Key? key}) : super(key: key);

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
