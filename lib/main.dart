import 'package:fe_lw_shams/main_design.dart';
import 'package:fe_lw_shams/view/login_page.dart';
import 'package:fe_lw_shams/view/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShamsApp());
}

class ShamsApp extends StatelessWidget {
  const ShamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => LoginPage(),
        SignupPage.routeName: (_) => SignupPage()
      },
    );
  }
}
