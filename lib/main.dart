import 'package:flutter/material.dart';
import 'GUI/Splash_Screen.dart';
import 'GUI/user_auth/ForgotPassword.dart';
import 'GUI/user_auth/Login_Page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
