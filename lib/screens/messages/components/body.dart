import 'package:chatapp/constants.dart';
import 'package:chatapp/models/ChatMessage.dart';
import 'package:chatapp/screens/messages/components/message.dart';
import 'package:flutter/material.dart';
import 'chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demoChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demoChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
