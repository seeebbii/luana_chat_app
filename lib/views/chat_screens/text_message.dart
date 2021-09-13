import 'package:flutter/material.dart';
import 'package:luana_chat_app/models/chat_model.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatModel? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: message!.isSender ? Colors.purple.shade800 : Colors.black,
      ),
      child: Text(
        message.message,
        style: TextStyle(
          color: message!.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
