import 'package:flutter/material.dart';

class ClosePart extends StatelessWidget {
  const ClosePart(
      {super.key,
      required this.openCloseValue,
      required this.translateValue,
      required this.rotateValue});
  final double openCloseValue;
  final double translateValue;
  final double rotateValue;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Curve closeCurve = Curves.linearToEaseOut;

    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: openCloseValue),
        duration: const Duration(seconds: 2),
        curve: closeCurve,
        builder: (context, value, child) {
          return Transform(
            alignment: Alignment.topLeft,
            transform: Matrix4.identity()
              ..translate(0.0, screenHeight * translateValue * value)
              ..rotateZ(rotateValue * value),
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
              ),
            ),
          );
        });
  }
}
