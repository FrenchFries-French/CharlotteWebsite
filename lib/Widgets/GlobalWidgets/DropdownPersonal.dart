import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/KategorienWidgets/PortfolioA.dart';
import 'package:charletwebsite/Widgets/KategorienWidgets/PortfolioB.dart';
import 'package:charletwebsite/Widgets/KategorienWidgets/PortfolioC.dart';
import 'package:sizer/sizer.dart';

class DDPersonal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DDPersonalState();
  }
}

class _DDPersonalState extends State<DDPersonal> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Portfolios",
          style: TextStyle(color: Colors.black, fontSize: 2.w)),
      elevation: 0,
      underline: Container(
        height: 0,
      ),
      icon: SizedBox(
        height: 0,
      ),
      onChanged: (value) {},
      items: [
        DropdownMenuItem(
          child: Text("Portfolio A",
              style: TextStyle(color: Colors.black, fontSize: 2.w)),
          value: "1",
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => PortfolioA(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
        ),
        DropdownMenuItem(
          child: Text("Portfolio B",
              style: TextStyle(color: Colors.black, fontSize: 2.w)),
          value: "2",
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => PortfolioB(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
        ),
        DropdownMenuItem(
          child: Text("Portfolio C",
              style: TextStyle(color: Colors.black, fontSize: 2.w)),
          value: "3",
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => PortfolioC(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
        ),
      ],
    );
  }
}
