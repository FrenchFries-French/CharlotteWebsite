import 'package:flutter/material.dart';
import 'package:charletwebsite/Widgets/GlobalWidgets/SelectionButton.dart';

class ToTheTopButton extends StatefulWidget {
  const ToTheTopButton({Key? key}) : super(key: key);

  @override
  _ToTheTopButtonState createState() => _ToTheTopButtonState();
}

class _ToTheTopButtonState extends State<ToTheTopButton>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
/*
  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }*/

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      name: "To the top",
      onTap: _scrollToTop,
      child: const SizedBox(),
    );
  }
}
