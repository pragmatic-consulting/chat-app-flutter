import 'package:chatapp/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      if (message.messageType == ChatMessageType.text) {
        return TextMessage(message: message);
      }
      return SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          messageContaint(message),
        ],
      ),
    );
  }
}

// class MessageStatusDot extends StatelessWidget {
//   final MessageStatus? status;

//   const MessageStatusDot({Key? key, this.status}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Color dotColor(MessageStatus status) {
//       switch (status) {
//         case MessageStatus.not_sent:
//           return kErrorColor;
//         case MessageStatus.not_view:
//           return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
//         case MessageStatus.viewed:
//           return kPrimaryColor;
//         default:
//           return Colors.transparent;
//       }
//     }

//     return Container(
//       margin: EdgeInsets.only(left: kDefaultPadding / 2),
//       height: 12,
//       width: 12,
//       decoration: BoxDecoration(
//         color: dotColor(status!),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         status == MessageStatus.not_sent ? Icons.close : Icons.done,
//         size: 8,
//         color: Theme.of(context).scaffoldBackgroundColor,
//       ),
//     );
//   }
// }
