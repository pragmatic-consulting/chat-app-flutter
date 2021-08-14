import 'package:chatapp/models/Chat.dart';
import 'package:chatapp/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => {
                      _save(index),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagesScreen(),
                        ),
                      ),
                    }),
          ),
        ),
      ],
    );
  }

  _save(int _index) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '2';
    final value = _index;
    prefs.setInt(key, value);
  }
}
