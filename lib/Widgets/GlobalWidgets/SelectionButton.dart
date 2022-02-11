import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class SelectionButton extends StatelessWidget {
  final String name;
  final void Function() onTap;
  final FontStyle? fontStyle;
  final Widget? child;

  SelectionButton({
    required this.name,
    required this.onTap,
    this.fontStyle,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: TextButton(
          onPressed: onTap,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Text(
                name,
                style: GoogleFonts.ubuntu(fontSize: 2.3.w, fontWeight: FontWeight.w400, color: Colors.black)
                /*style: TextStyle(
                  color: Colors.black,
                  // fontSize: 14,
                  fontSize: 2.w,
                  fontStyle: fontStyle,

                ),*/

              ),
              child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
