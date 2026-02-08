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
          color: Colors.blueGrey[50],
        ),
        Positioned(
          left: 0,
          child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: value,
                    child: child,
                  ),
                );
              },
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.9,
                  color: Colors.yellowAccent.withOpacity(0.3),
                ),
              )),
        ),
        Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width * 0.09,
            child: Text(
              "مرحباََ بك !",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.orangeAccent),
            )),
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
        )
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // نرسم 3 نقاط = مثلث
    path.moveTo(0, 0); // فوق يسار
    path.lineTo(size.width, 0); // فوق يمين
    path.lineTo(0, size.height); // تحت يسار

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
