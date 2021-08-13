import 'package:chatapp/screens/login/signin_or_signup.dart';
//import 'package:chatapp/screens/welcome/welcome_screen.dart';
import 'package:chatapp/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduChat app',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      home: SigninOrSignupScreen(),
    );
  }
}
