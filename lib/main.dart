import 'package:fe_lw_shams/controller/direction_provider.dart';
import 'package:fe_lw_shams/controller/theme_provider.dart';
import 'package:fe_lw_shams/view/login_page.dart';
import 'package:fe_lw_shams/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => DirectionProvider()),
    ],
    child: const ShamsApp(),
  ));
}

class ShamsApp extends StatelessWidget {
  const ShamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, DirectionProvider>(
      builder: (context, themeProvider, directionProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            builder: (context, child) {
              return Directionality(
                textDirection: directionProvider.textDirection,
                child: child!,
              );
            },
            initialRoute: LoginPage.routeName,
            routes: {
              LoginPage.routeName: (_) => LoginPage(),
              SignupPage.routeName: (_) => SignupPage()
            });
      },
    );
  }
}
