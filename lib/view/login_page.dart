import 'dart:math';

import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.grey[50],
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 500
                ? MediaQuery.of(context).size.width * 0.7
                : MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField01(
                  controller: usernameController,
                  label: "اسم المستخدم (البريد الالكتروني)",
                  inputType: TextInputType.emailAddress,
                  textDir: TextDirection.ltr,
                ),
                TextField01(
                  controller: passwordController,
                  label: "كلمة المرور",
                  obscureText: true,
                  textDir: TextDirection.ltr,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubicEmphasized,
            builder: (context, value, child) {
              return Transform(
                alignment: Alignment.topLeft,
                transform: Matrix4.identity()
                  ..translate(0.0, -screenHeight * 0.35 * value)
                  ..rotateZ(-0.2 * value),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  color: Colors.blueGrey,
                ),
              );
            },
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOutCubicEmphasized,
                builder: (context, value, child) {
                  return Transform(
                    alignment: Alignment.topLeft,
                    transform: Matrix4.identity()
                      ..translate(0.0, screenHeight * 0.35 * value)
                      ..rotateZ(0.2 * value),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.5,
                      color: Colors.blueGrey,
                    ),
                  );
                })),
        Positioned(
          top: (screenHeight * 0.5) - 50,
          left: (screenWidth * 0.5) - 50,
          child: TweenAnimationBuilder<double>(
            // المرحلة الأولى: الدوران
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
            builder: (context, rotateValue, child) {
              return TweenAnimationBuilder<double>(
                // المرحلة الثانية: الحركة بعد الدوران
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                builder: (context, moveValue, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, -100 * moveValue)
                      ..rotateY(0.5),
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: SpinningCirclePainter(rotateValue),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SpinningCirclePainter extends CustomPainter {
  final double rotation; // زاوية الدوران

  SpinningCirclePainter(this.rotation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 8; i++) {
      double angle = (i * 2 * 3.1416 / 8) + rotation;
      final start = Offset(
        center.dx + radius * 0.8 * cos(angle),
        center.dy + radius * 0.8 * sin(angle),
      );
      final end = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SpinningCirclePainter oldDelegate) => true;
}
