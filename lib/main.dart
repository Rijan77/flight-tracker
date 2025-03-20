import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'GUI/Splash_Screen.dart';
import 'GUI/user_auth/homePage.dart';
import 'UserProfile/EditProfilePage.dart';
import 'UserProfile/SettingsPage.dart';
import 'UserProfile/userProfile.dart';
import 'booking/FlightSearchScreen.dart';
import 'booking/PassengerContactFormScreen.dart';
//import 'GUI/Home.dart';
//import 'booking/PassengerContactFormScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
        ,
    );
  }
}
