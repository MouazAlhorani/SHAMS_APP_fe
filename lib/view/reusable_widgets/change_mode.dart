import 'dart:math';

import 'package:fe_lw_shams/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeModeWidget extends StatelessWidget {
  const ChangeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 0,
          end: Theme.of(context).brightness == Brightness.light
              ? 0
              : -25 * pi / 180,
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value,
            child: IconButton(
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
              iconSize: 35,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.yellow[700]
                  : Colors.grey,
              icon: Icon(Theme.of(context).brightness == Brightness.light
                  ? Icons.sunny
                  : Icons.nights_stay),
            ),
          );
        });
  }
}
