import 'package:chatapp/models/SignupUser.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  // final SignupUser user;
  // ProfileScreen(this.user);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
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
                "Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "role d'administration",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [BackButton(), Text("Profil")],
      ),
    );
  }
}
