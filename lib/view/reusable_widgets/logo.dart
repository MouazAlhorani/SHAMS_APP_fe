import 'dart:math';

import 'package:flutter/material.dart';

class SunRays extends StatelessWidget {
  final int rayCount;
  final double radius;
  const SunRays({super.key, this.rayCount = 20, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 4,
      height: radius * 4,
      child: Stack(alignment: Alignment.center, children: [
        ...List.generate(rayCount, (index) {
          final angle = 2 * pi * index / rayCount; // زاوية كل شعاع
          return Transform.rotate(
            angle: angle,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 10, // عرض الشعاع
                height: 50, // طول الشعاع
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.6),
                  border: Border(
                    top: BorderSide(
                        color: Colors.deepOrange.withOpacity(0.6), width: 3),
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(100, 300),
                  ),
                ),
              ),
            ),
          );
        }),
        Center(
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: Colors.deepOrange.withOpacity(0.6), width: 2)),
          ),
        )
      ]),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.openCloseValue});
  final double openCloseValue;
  @override
  Widget build(BuildContext context) {
    Curve closeCurve = Curves.linearToEaseOut;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: openCloseValue == 1.0 ? 200 : 0.0),
      duration: const Duration(milliseconds: 2300),
      curve: closeCurve,
      builder: (context, moveValue, child) {
        return Transform.translate(
          offset: Offset(0.0, moveValue),
          child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: openCloseValue == 1.0 ? 1.0 : 1.5),
              duration: const Duration(seconds: 1),
              curve: closeCurve,
              builder: (context, moveValue, child) {
                return Transform.scale(
                    scale: moveValue,
                    child: Transform.translate(
                        offset: Offset(moveValue, 0.0),
                        child: SunRays(
                          rayCount: 20,
                          radius: 20,
                        )));
              }),
        );
      },
    );
  }
}
