import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  String _name = '';
  @override
  Widget build(BuildContext context) {
    _read();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage("assets/images/user_profile.png"),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                '${_name}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Formateur référent",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statWidget("Abonnés", "20"),
                  statWidget("Cours", "55"),
                  statWidget("eleves", "70"),
                ],
              )
            ],
          ),
        ));
  }

  void _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '1';
    final value = prefs.getString(key) ?? 'admin';
    setState(() {
      _name = value;
    });
  }
}

Widget statWidget(String title, String stat) {
  return Expanded(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        Text(
          stat,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}
