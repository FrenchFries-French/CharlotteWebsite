import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/GlobalWidgets/SelectionButton.dart';

class DDCommissioned extends StatefulWidget {
  @override
  _DDCommissionedState createState() => _DDCommissionedState();
}

class _DDCommissionedState extends State<DDCommissioned> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        hint: Text("Commissioned",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        elevation: 0,
        underline: Container(height: 0,),
        icon: SizedBox(height: 0,),
        onChanged: (value) {},
        items: [
          DropdownMenuItem(
            child: Text("Portfolio A",
                style: TextStyle(color: Colors.black, fontSize: 14)),
            value: "Portfolio A",
          ),
          DropdownMenuItem(
            child: Text("Portfolio B",
                style: TextStyle(color: Colors.black, fontSize: 14)),
            value: "Portfolio B",
          ),
          DropdownMenuItem(
            child: Text("Portfolio C",
                style: TextStyle(color: Colors.black, fontSize: 14)),
            value: "Portfolio C",
          ),
        ],
      ),
    );
  }
}
