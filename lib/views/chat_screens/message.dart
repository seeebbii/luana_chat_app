import 'package:flutter/material.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatModel? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: message!.sendBy != null
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/3b/ff/bd/3bffbd11a40e99fc595a8ef0fd07c992.jpg"),
            ),
            SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}
