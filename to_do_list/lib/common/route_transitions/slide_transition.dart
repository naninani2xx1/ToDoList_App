import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/utils/slide_trasition_type.dart';

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required Widget child,
    required SlideTransitionType typeSlide,
    Key? key,
    LocalKey? pageKey,
  }) : super(
          key: pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            late Offset offset;

            if (typeSlide == SlideTransitionType.left) {
              offset = const Offset(1, 0);
            } else if (typeSlide == SlideTransitionType.right) {
              offset = const Offset(-1, 0);
            } else if (typeSlide == SlideTransitionType.top) {
              offset = const Offset(0, 1);
            } else {
              offset = const Offset(0, -1);
            }

            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: offset, // start position of the transition
                end: Offset.zero, // end position of the transition
              ).animate(curvedAnimation),
              child: child,
            );
          },
        );
}
