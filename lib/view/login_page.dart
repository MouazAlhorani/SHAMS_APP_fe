import 'package:fe_lw_shams/constan_value.dart';
import 'package:fe_lw_shams/model/arrays/input_fields.dart';
import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:fe_lw_shams/view/reusable_widgets/change_mode.dart';
import 'package:fe_lw_shams/view/reusable_widgets/close_part.dart';
import 'package:fe_lw_shams/view/reusable_widgets/logo.dart';
import 'package:fe_lw_shams/view/reusable_widgets/logo_name.dart';
import 'package:fe_lw_shams/view/signup_page.dart';
import 'package:flutter/material.dart';

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
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[200]
                  : Colors.black87,
            ),
            Positioned(
                top: 125,
                right: 25,
                child: Row(
                  children: [ChangeModeWidget()],
                )),
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
                bottom: 0,
                right: 0,
                child: ClosePart(
                  openCloseValue: openCloseValue,
                  translateValue: 0.35,
                  rotateValue: 0.2,
                )),
            Positioned(
                top: 0,
                right: 0,
                child: ClosePart(
                  openCloseValue: openCloseValue,
                  translateValue: -0.35,
                  rotateValue: -0.2,
                )),
            Center(child: Logo(openCloseValue: openCloseValue)),
            const Positioned(left: 15, bottom: 5, child: LogoName()),
          ]),
        ),
      ),
    );
  }
}
