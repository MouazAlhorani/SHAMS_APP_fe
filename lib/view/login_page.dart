import 'dart:math';

import 'package:fe_lw_shams/model/arrays/input_fields.dart';
import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;

  double openCloseValue = 0.0;
  bool loginScreen = true;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        openCloseValue = 1.0;
      });
    });
  }

  Curve closeCurve = Curves.linearToEaseOut;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<InputFields> loginFields = [
      InputFields(
          index: 1,
          focus: true,
          controller: emailController,
          label: "البريد الالكتروني",
          inputType: TextInputType.emailAddress,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 2,
          controller: passwordController,
          label: "كلمة المرور",
          obscuretext: true,
          textDirection: TextDirection.ltr)
    ];
    List<InputFields> signupFields = [
      InputFields(
          index: 1, focus: true, controller: nameController, label: "الاسم"),
      InputFields(index: 2, controller: mobileController, label: "الهاتف"),
      InputFields(
          index: 3,
          controller: emailController,
          label: "الايميل",
          inputType: TextInputType.emailAddress,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 4,
          controller: passwordController,
          label: "كلمة المرور",
          obscuretext: true,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 5,
          controller: confirmpasswordController,
          label: "تأكيد كلمة المرور",
          obscuretext: true,
          textDirection: TextDirection.ltr)
    ];
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...loginScreen
                      ? loginFields.map((e) => TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: Duration(seconds: e.index * 1),
                          curve: closeCurve,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: TextField01(
                                  autofocus: e.focus,
                                  controller: e.controller,
                                  label: e.label,
                                  inputType: e.inputType,
                                  textDir: e.textDirection,
                                  obscureText: e.obscuretext),
                            );
                          }))
                      : signupFields.map((e) => TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: Duration(seconds: e.index * 1),
                          curve: closeCurve,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: TextField01(
                                  autofocus: e.focus,
                                  controller: e.controller,
                                  label: e.label,
                                  inputType: e.inputType,
                                  textDir: e.textDirection,
                                  obscureText: e.obscuretext),
                            );
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                              loginScreen ? "تسجيل الدخول" : "تسجيل حساب جديد"),
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
                            openCloseValue = 1.0;
                            if (loginScreen) {
                              signupFields[0].focus = false;
                              loginFields[0].focus = true;
                            } else {
                              loginFields[0].focus = false;
                              signupFields[0].focus = true;
                            }
                            loginScreen = loginScreen ? false : true;
                          });
                        });
                      },
                      child: Text(loginScreen
                          ? "ليس لديك حساب _ تسجيل حساب جديد"
                          : "عودة إلى تسجيل الدخول"))
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: openCloseValue),
            duration: const Duration(seconds: 2),
            curve: closeCurve,
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
                curve: closeCurve,
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
        Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(
                begin: 0.0,
                end: openCloseValue == 1.0
                    ? loginScreen
                        ? -150
                        : -225.0
                    : 0.0),
            duration: const Duration(seconds: 1),
            curve: closeCurve,
            builder: (context, moveValue, child) {
              return Transform.translate(
                offset: Offset(0.0, moveValue),
                child: TweenAnimationBuilder<double>(
                    tween: Tween(
                        begin: 0.0, end: openCloseValue == 1.0 ? 1.0 : 1.5),
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
          ),
        ),
        Positioned(
            left: 15,
            bottom: 5,
            child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 5),
                curve: closeCurve,
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

class SunRays extends StatelessWidget {
  final int rayCount; // عدد الأشعة
  final double radius; // نصف قطر الدائرة التي تدور حولها الأشعة

  const SunRays({super.key, this.rayCount = 20, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 4,
      height: radius * 4,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(rayCount, (index) {
          final angle = 2 * pi * index / rayCount; // زاوية كل شعاع
          return Transform.rotate(
            angle: angle,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 10, // عرض الشعاع
                height: 50, // طول الشعاع
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(100, 300),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
