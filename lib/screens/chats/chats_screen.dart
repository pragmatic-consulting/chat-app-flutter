import 'package:chatapp/constants.dart';
import 'package:chatapp/models/SignupUser.dart';
import 'package:chatapp/screens/pages/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  final SignupUser user;
  ChatsScreen(this.user);
  @override
  _ChatsScreenState createState() => _ChatsScreenState(this.user);
}

class _ChatsScreenState extends State<ChatsScreen> {
  final SignupUser user;
  final _pageController = PageController();
  // final profileScreen = ProfileScreen(user);
  final List<Widget> _tabItems = [Body(), Body(), Body(), ProfileScreen()];
  _ChatsScreenState(this.user);

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        //body: Body(),
        body: _tabItems[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: kPrimaryColor,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, color: Colors.white, size: 30),
            Icon(Icons.chat_bubble, color: Colors.white, size: 30),
            Icon(Icons.people, color: Colors.white, size: 30),
            Icon(Icons.portrait, color: Colors.white, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ));

    // body: Container(
    //   color: Colors.white,
    //   child: Center(
    //     child: Column(
    //       children: <Widget>[
    //         Text(_page.toString(), textScaleFactor: 10.0),
    //       ],
    //     ),
    //   ),
    // ));
  }

  // CurvedNavigationBar buildBottomNavigationBar() {
  //   return CurvedNavigationBar(
  //     backgroundColor: Colors.white,
  //     color: kPrimaryColor,
  //     key: _bottomNavigationKey,
  //     items: <Widget>[
  //       Icon(Icons.add, color: Colors.white, size: 30),
  //       Icon(Icons.chat_bubble, color: Colors.white, size: 30),
  //       Icon(Icons.people, color: Colors.white, size: 30),
  //       Icon(Icons.portrait, color: Colors.white, size: 30),
  //     ],
  //     onTap: (index) {
  //       setState(() {
  //         _page = index;
  //       });
  //     },
  //   );
  // }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [BackButton(), Text("Conversations")],
      ),
    );
  }
}
