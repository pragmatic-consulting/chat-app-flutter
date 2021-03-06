import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/blog/blogListScreen.dart';
import 'package:chatapp/screens/pages/profile_screen.dart';
import 'package:chatapp/screens/quiz/quiz_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<Widget> _tabItems = [
    BlogListScreen(),
    QuizScreen(),
    Body(),
    ProfileScreen()
  ];
  _ChatsScreenState();

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(_page),
        //body: Body(),
        body: _tabItems[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white.withOpacity(0),
          color: kPrimaryColor,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.article, color: Colors.white, size: 30),
            Icon(Icons.quiz, color: Colors.white, size: 30),
            Icon(Icons.chat_bubble, color: Colors.white, size: 30),
            Icon(Icons.portrait, color: Colors.white, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ));
  }

  AppBar buildAppBar(int _page) {
    if (_page == 3) {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [BackButton(), Text("Profil")],
        ),
      );
    } else if (_page == 2) {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [BackButton(), Text("Conversations")],
        ),
      );
    } else if (_page == 0) {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [BackButton(), Text("Articles")],
        ),
      );
    }

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [BackButton(), Text("Quiz")],
      ),
    );
  }
}
