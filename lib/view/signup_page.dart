import 'dart:math';

import 'package:fe_lw_shams/main_design.dart';
import 'package:fe_lw_shams/model/arrays/input_fields.dart';
import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:fe_lw_shams/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String routeName = "signupPage";

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;

  double openCloseValue = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 1),
        () => setState(() {
              openCloseValue = 1.0;
            }));

    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
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

  String actualLayerNumber = "first";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<InputFields> signupFields = [
      InputFields(
        index: 1,
        layerNumber: "first",
        focus: true,
        controller: nameController,
        label: "الاسم",
      ),
      InputFields(
        index: 2,
        controller: mobileController,
        layerNumber: "first",
        inputType: TextInputType.phone,
        label: "الهاتف",
      ),
      InputFields(
          index: 3,
          layerNumber: "final",
          controller: emailController,
          label: "الايميل",
          inputType: TextInputType.emailAddress,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 4,
          layerNumber: "final",
          controller: passwordController,
          label: "كلمة المرور",
          obscuretext: true,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 5,
          layerNumber: "final",
          controller: confirmpasswordController,
          label: "تأكيد كلمة المرور",
          obscuretext: true,
          textDirection: TextDirection.ltr)
    ];
    return SafeArea(
      child: Directionality(
        textDirection: mainDirection,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.grey[200],
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 500
                      ? MediaQuery.of(context).size.width * 0.7
                      : MediaQuery.of(context).size.width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...signupFields.map((e) {
                          if (e.layerNumber == actualLayerNumber) {
                            return TweenAnimationBuilder(
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
                                });
                          } else {
                            return SizedBox();
                          }
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                actualLayerNumber != "first"
                                    ? ElevatedButton.icon(
                                        onPressed: () {
                                          switch (actualLayerNumber) {
                                            case "final":
                                              setState(() {
                                                actualLayerNumber = "first";
                                              });
                                              break;

                                            default:
                                          }
                                        },
                                        label: Text("السابق"),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))))
                                    : SizedBox(),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      switch (actualLayerNumber) {
                                        case "first":
                                          setState(() {
                                            actualLayerNumber = "final";
                                          });
                                          break;

                                        default:
                                      }
                                    },
                                    label: Text(actualLayerNumber == "final"
                                        ? "تسجيل حساب جديد"
                                        : "التالي"),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                              ],
                            ),
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
                                    context, LoginPage.routeName);
                              },
                              child: Text("رجوع الى تسجيل الدخول")),
                        )
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
                      Tween(begin: 0.0, end: openCloseValue == 1.0 ? 180 : 0.0),
                  duration: const Duration(seconds: 1),
                  curve: closeCurve,
                  builder: (context, moveValue, child) {
                    return Transform.translate(
                      offset: Offset(0.0, moveValue),
                      child: TweenAnimationBuilder<double>(
                          tween: Tween(
                              begin: 0.0,
                              end: openCloseValue == 1.0 ? 0.8 : 1.5),
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
          ),
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
