import 'package:fe_lw_shams/main_design.dart';
import 'package:fe_lw_shams/view/login_page.dart';
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
        home: Scaffold(
          body: SafeArea(
              child: Directionality(
                  textDirection: mainDirection, child: LoginPage())),
        ));
  }
}
