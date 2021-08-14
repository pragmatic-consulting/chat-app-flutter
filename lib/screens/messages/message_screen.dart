import 'package:chatapp/constants.dart';
import 'package:chatapp/models/Chat.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  late Chat chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    _read();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(chat.image),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${chat.name}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  void _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '2';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      chat = chatsData[value];
    });
  }
}
