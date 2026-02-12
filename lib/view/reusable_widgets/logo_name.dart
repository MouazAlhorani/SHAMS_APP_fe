import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 5),
        curve: Curves.linearToEaseOut,
        builder: (context, moveValue, child) {
          return Opacity(
              opacity: moveValue,
              child: Center(
                child: Text(
                  "شمس",
                  style: TextStyle(
                      fontFamily: 'ReemKufiFun',
                      fontSize: 35,
                      color: Colors.white),
                ),
              ));
        });
  }
}
