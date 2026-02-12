import 'package:fe_lw_shams/controller/theme_provider.dart';
import 'package:fe_lw_shams/constan_value.dart';
import 'package:fe_lw_shams/view/login_page.dart';
import 'package:fe_lw_shams/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const ShamsApp(),
  ));
}

class ShamsApp extends StatelessWidget {
  const ShamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            initialRoute: LoginPage.routeName,
            routes: {
              LoginPage.routeName: (_) => LoginPage(),
              SignupPage.routeName: (_) => SignupPage()
            });
      },
    );
  }
}
