import 'package:fe_lw_shams/model/arrays/input_fields.dart';
import 'package:fe_lw_shams/model/widgets_tamplate/text_field_01.dart';
import 'package:fe_lw_shams/services/lang_service.dart';
import 'package:fe_lw_shams/view/login_page.dart';
import 'package:fe_lw_shams/view/reusable_widgets/change_lang.dart';
import 'package:fe_lw_shams/view/reusable_widgets/change_mode.dart';
import 'package:fe_lw_shams/view/reusable_widgets/close_part.dart';
import 'package:fe_lw_shams/view/reusable_widgets/logo.dart';
import 'package:fe_lw_shams/view/reusable_widgets/logo_name.dart';
import 'package:flutter/material.dart';

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
        const Duration(seconds: 1),
        () => setState(() {
              openCloseValue = 1.0;
            }));

    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

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
        label: LangService.t("name"),
      ),
      InputFields(
        index: 2,
        controller: mobileController,
        layerNumber: "first",
        inputType: TextInputType.phone,
        label: LangService.t("mobile"),
      ),
      InputFields(
          index: 3,
          layerNumber: "final",
          controller: emailController,
          label: LangService.t("e-mail"),
          inputType: TextInputType.emailAddress,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 4,
          layerNumber: "final",
          controller: passwordController,
          label: LangService.t("password"),
          obscuretext: true,
          textDirection: TextDirection.ltr),
      InputFields(
          index: 5,
          layerNumber: "final",
          controller: confirmpasswordController,
          label: "${LangService.t("confirm")}  ${LangService.t("password")}",
          obscuretext: true,
          textDirection: TextDirection.ltr)
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[200]
                  : Colors.black87,
            ),
            const Positioned(
                top: 125,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ChangeModeWidget(), ChangeLang()],
                  ),
                )),
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
                              curve: Curves.linearToEaseOut,
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
                          return const SizedBox();
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
                                      label: Text(LangService.t("previous")),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))))
                                  : const SizedBox(),
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
                                      ? LangService.t("signup")
                                      : LangService.t("next")),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextButton(
                          onPressed: () async {
                            setState(() {
                              openCloseValue = 0.0;
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: Text(LangService.t("go-back-to-login")))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: ClosePart(
                  openCloseValue: openCloseValue,
                  translateValueX: -45.0,
                  translateValueY: 0.40,
                  rotateValue: 0.0,
                )),
            Positioned(
                top: 0,
                right: 0,
                child: ClosePart(
                  openCloseValue: openCloseValue,
                  translateValueX: 45.0,
                  translateValueY: -0.40,
                  rotateValue: 0.0,
                )),
            Center(child: Logo(openCloseValue: openCloseValue)),
            const Positioned(left: 15, bottom: 5, child: LogoName()),
          ],
        ),
      ),
    );
  }
}
