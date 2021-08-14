import 'package:chatapp/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message!.text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
//  Expanded(
//         child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,

//       children: [

//         Text(
//           message!.text,
//           style: TextStyle(color: Colors.black),
//         ),
//       ],
//     ))
    );
  }
}
