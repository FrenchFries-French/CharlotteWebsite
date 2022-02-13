import 'package:flutter/material.dart';

class DDCommissioned extends StatefulWidget {
  const DDCommissioned({Key? key}) : super(key: key);

  @override
  _DDCommissionedState createState() => _DDCommissionedState();
}

class _DDCommissionedState extends State<DDCommissioned> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        hint: const Text("Commissioned",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        elevation: 0,
        underline: Container(
          height: 0,
        ),
        icon: const SizedBox(
          height: 0,
        ),
        onChanged: (value) {},
        items: const [
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
