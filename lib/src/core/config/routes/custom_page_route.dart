// import 'package:flutter/material.dart';

// class CustomPageRouteBuilder<T> extends PageRoute<T> {
//   final RoutePageBuilder pageBuilder;
//   final Duration? forwardDuration;
//   final Duration? backDuration;
//   final PageTransitionsBuilder matchingBuilder =
//       const CupertinoPageTransitionsBuilder(); // Default iOS/macOS (to get the swipe right to go back gesture)
//   // final PageTransitionsBuilder matchingBuilder = const FadeUpwardsPageTransitionsBuilder(); // Default Android/Linux/Windows

//   CustomPageRouteBuilder({
//     required this.pageBuilder,
//     this.forwardDuration,
//     this.backDuration,
//   });

//   @override
//   Color? get barrierColor => null;

//   @override
//   String? get barrierLabel => null;

//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return pageBuilder(context, animation, secondaryAnimation);
//   }

//   @override
//   bool get maintainState => true;

//   @override
//   Duration get transitionDuration =>
//       forwardDuration ??
//       const Duration(
//           milliseconds:
//               900); // Can give custom Duration, unlike in MaterialPageRoute
//   @override
//   Duration get reverseTransitionDuration =>
//       backDuration ?? super.reverseTransitionDuration;
//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     return matchingBuilder.buildTransitions<T>(
//         this, context, animation, secondaryAnimation, child);
//   }
// }
