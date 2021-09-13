import 'package:flutter/material.dart';
import 'package:luana_chat_app/views/chat_screens/chat_input_field.dart';
import 'package:luana_chat_app/views/chat_screens/chat_message.dart';

import 'message.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            title!,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: demeChatMessages.length,
                  itemBuilder: (context, index) =>
                      Message(message: demeChatMessages[index]),
                ),
              ),
            ),
            ChatInputField(
              title: title,
            ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment(1, 0.8),
          child: Image.asset(
            'assets/images/gift.png',
            width: 80,
            height: 80,
          ),
        ));
  }
}
