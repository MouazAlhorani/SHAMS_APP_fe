import 'package:fe_lw_shams/controller/direction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  context.watch<DirectionProvider>().textDirection ==
                          TextDirection.rtl
                      ? "شمس"
                      : "SHAMS",
                  style: TextStyle(
                      fontFamily: 'ReemKufiFun',
                      fontSize:
                          context.watch<DirectionProvider>().textDirection ==
                                  TextDirection.rtl
                              ? 35
                              : 25,
                      color: Colors.white),
                ),
              ));
        });
  }
}
