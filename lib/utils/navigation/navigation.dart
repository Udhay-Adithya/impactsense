import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void nav(BuildContext ctx, Widget destinationPage) {
  Navigator.push(
    ctx,
    PageTransition(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      type: PageTransitionType.fade,
      child: destinationPage,
    ),
  );
}

void authNav(BuildContext ctx, Widget destinationPage) {
  Navigator.pushAndRemoveUntil(
    ctx,
    PageTransition(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      type: PageTransitionType.fade,
      child: destinationPage,
    ),
    (Route<dynamic> route) => false,
  );
}
