import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SelectionButton extends StatelessWidget {
  final String name;
  final void Function() onTap;
  final FontStyle? fontStyle;
  final Widget? child;

  const SelectionButton({
    Key? key,
    required this.name,
    required this.onTap,
    this.fontStyle,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextButton(
        onPressed: onTap,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(name,
                style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
