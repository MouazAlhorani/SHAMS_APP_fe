import 'dart:math';

import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double openCloseValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        openCloseValue = 1.0;
      });
    });
    super.initState();
  }

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text("تسجيل الدخول"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        openCloseValue = 0.0;
                      });
                      Future.delayed(const Duration(milliseconds: 1700), () {
                        setState(() {
                          openCloseValue = 1.0; // افتح من جديد
                        });
                      });
                    },
                    child: Text("ليس لديك حساب و تسجيل حساب جديد"))
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: openCloseValue),
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
                  decoration: BoxDecoration(
                      color: openCloseValue == 1.0
                          ? Colors.blue[100]
                          : Colors.black,
                      border: Border(
                          bottom: BorderSide(
                              width: 5,
                              color: openCloseValue == 1.0
                                  ? Colors.blue.withOpacity(0.5)
                                  : Colors.black.withOpacity(0.5)))),
                ),
              );
            },
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: openCloseValue),
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
                      decoration: BoxDecoration(
                          color: openCloseValue == 1.0
                              ? Colors.green[200]
                              : Colors.black,
                          border: Border(
                              top: BorderSide(
                                  width: 5,
                                  color: openCloseValue == 1.0
                                      ? Colors.green.withOpacity(0.5)
                                      : Colors.black))),
                    ),
                  );
                })),
        Positioned(
          top: (screenHeight * 0.5) - 50,
          left: (screenWidth * 0.5) - 50,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: openCloseValue == 1.0 ? -150.0 : 0.0),
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            builder: (context, moveValue, child) {
              return Transform.translate(
                offset: Offset(0.0, moveValue),
                child: TweenAnimationBuilder<double>(
                    tween: Tween(
                        begin: 0.0, end: openCloseValue == 0.0 ? 1.0 : 0.45),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    builder: (context, moveValue, child) {
                      return Transform.scale(
                          scale: moveValue,
                          child: Transform.translate(
                            offset: Offset(moveValue, 0.0),
                            child: CustomPaint(
                              size: const Size(100, 100),
                              painter: SpinningCirclePainter(0.0),
                            ),
                          ));
                    }),
              );
            },
          ),
        ),
        Positioned(
            left: 15,
            bottom: 5,
            child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 5),
                curve: Curves.easeOut,
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
                })),
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
      ..color = const Color.fromARGB(202, 233, 147, 19)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    const int count = 20; // عدد الأشعة
    final double baseWidth = radius * 1.0; // عرض القاعدة (عدلها حسب الشكل)

    for (int i = 0; i < count; i++) {
      final double angle = (i * 2 * pi / count) + rotation;

      // رأس المثلث (قريب من المركز)
      final tip = Offset(
        center.dx + radius * 0.5 * cos(angle),
        center.dy + radius * 0.5 * sin(angle),
      );

      // منتصف القاعدة (على الحافة)
      final baseCenter = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // زاوية عمودية
      final double perpAngle = angle + pi / 2;

      // طرفي القاعدة
      final baseLeft = Offset(
        baseCenter.dx + baseWidth * cos(perpAngle),
        baseCenter.dy + baseWidth * sin(perpAngle),
      );

      final baseRight = Offset(
        baseCenter.dx - baseWidth * cos(perpAngle),
        baseCenter.dy - baseWidth * sin(perpAngle),
      );

      // رسم المثلث
      final path = Path()
        ..moveTo(tip.dx, tip.dy)
        ..lineTo(baseLeft.dx, baseLeft.dy)
        ..lineTo(baseRight.dx, baseRight.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SpinningCirclePainter oldDelegate) {
    return oldDelegate.rotation != rotation;
  }
}
