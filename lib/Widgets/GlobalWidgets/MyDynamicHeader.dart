// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'TopNavBar.dart';
import 'package:sizer/sizer.dart';

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return TopNavBar();
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 6.h;

  @override
  double get minExtent => 4.5.h;
}
