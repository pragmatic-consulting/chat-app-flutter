import 'package:chatapp/screens/login/signin_or_signup.dart';
//import 'package:chatapp/screens/welcome/welcome_screen.dart';
import 'package:chatapp/themes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eduka sample app',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      home: SigninOrSignupScreen(),
    );
  }
}
