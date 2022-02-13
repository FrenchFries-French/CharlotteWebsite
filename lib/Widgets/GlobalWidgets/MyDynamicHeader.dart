// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'TopNavBar.dart';
import 'package:sizer/sizer.dart';

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      return const TopNavBar();
    });
  }

  @override
  bool shouldRebuild(
          // ignore: avoid_renaming_method_parameters
          SliverPersistentHeaderDelegate sliverPersistentHeaderDelegate) =>
      true;

  @override
  double get maxExtent =>
      // maxExtent;
      SizerUtil.width <= 1000 && SizerUtil.width > 700
          ? 12.h
          : SizerUtil.width < 700
              ? 10.h
              : 9.h;

  @override
  double get minExtent => 3.h;
}
