import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class BulletPointService extends StatelessWidget {

  BulletPointService({required this.text});

  String text;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(height: 1.w,
          width: 1.w,
          color: Colors.black,
        ),
        SizedBox(width: 2.w,),
        Text('$text', style: TextStyle(fontSize: 2.w),),
      ],
    );
  }
}