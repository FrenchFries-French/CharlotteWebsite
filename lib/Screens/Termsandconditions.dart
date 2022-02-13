import 'package:flutter/material.dart';
import '../Widgets/GlobalWidgets/MyDynamicHeader.dart';
import '../Widgets/GlobalWidgets/BottomNavBar.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({Key? key}) : super(key: key);

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
