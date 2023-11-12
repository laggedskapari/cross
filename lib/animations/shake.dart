import 'package:flutter/material.dart';

@immutable
class Shake extends StatelessWidget {
  const Shake(
      {super.key,
      this.duration = const Duration(milliseconds: 500),
      this.deltaX = 20,
      this.curve = Curves.bounceOut,
      required this.child});

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), 0),
        child: child,
      ),
      child: child,
    );
  }
}
