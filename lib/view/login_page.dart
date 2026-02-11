import 'dart:math';

import 'package:fe_lw_shams/main_design.dart';
import 'package:fe_lw_shams/model/arrays/input_fields.dart';
import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:fe_lw_shams/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = "loginPage";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  double openCloseValue = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration(seconds: 1),
        () => setState(() {
              openCloseValue = 1.0;
            }));
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Curve closeCurve = Curves.linearToEaseOut;
  bool rtlDirection = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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

    return SafeArea(
      child: Directionality(
        textDirection: mainDirection,
        child: Scaffold(
          body: Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.grey[200],
            ),
            Positioned(
                top: 125,
                right: 25,
                child: Switch(
                    value: rtlDirection,
                    onChanged: (v) {
                      setState(() {
                        rtlDirection = v;
                        if (rtlDirection) {
                          mainDirection = TextDirection.rtl;
                        } else {
                          mainDirection = TextDirection.ltr;
                        }
                      });
                    })),
            Positioned(top: 160, right: 25, child: Text("اللغة")),
            Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width > 500
                        ? MediaQuery.of(context).size.width * 0.7
                        : MediaQuery.of(context).size.width * 0.9,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        ...loginFields.map((e) => TweenAnimationBuilder(
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
                                label: Text("تسجيل الدخول"),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                        ),
                        SizedBox(height: 25),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  openCloseValue = 0.0;
                                });
                                await Future.delayed(Duration(seconds: 2));
                                Navigator.pushNamed(
                                    context, SignupPage.routeName);
                              },
                              child: Text("ليس لديك حساب _ تسجيل حساب جديد")),
                        )
                      ],
                    )))),
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
                            color: Colors.blueGrey,
                          )));
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
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    })),
            Center(
              child: TweenAnimationBuilder<double>(
                tween:
                    Tween(begin: 0.0, end: openCloseValue == 1.0 ? 150 : 0.0),
                duration: const Duration(seconds: 1),
                curve: closeCurve,
                builder: (context, moveValue, child) {
                  return Transform.translate(
                    offset: Offset(0.0, moveValue),
                    child: TweenAnimationBuilder<double>(
                        tween: Tween(
                            begin: 0.0, end: openCloseValue == 1.0 ? 0.8 : 1.5),
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
                    }))
          ]),
        ),
      ),
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
