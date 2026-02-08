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
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: -150, end: -15), // من خارج الشاشة لليمين
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Positioned(
              top: -200,
              left: value,
              child: Transform.rotate(
                angle: 1.0 - value / 150,
                child: Container(
                  width: 200,
                  height: 800,
                  color: Colors.blueAccent.withOpacity(0.4),
                  child: Center(
                      child: Transform.rotate(
                    angle: -1.3,
                    child: Text(
                      'مرحبا بك!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.withOpacity(0.7),
                      ),
                    ),
                  )),
                ),
              ),
            );
          },
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
        )
      ],
    );
  }
}
