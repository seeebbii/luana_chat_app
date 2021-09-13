import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatModel? message;

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:  message!.sendBy !=  authController.currentUser.value!.uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if ( message!.sendBy !=  authController.currentUser.value!.uid ) ...[
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/3b/ff/bd/3bffbd11a40e99fc595a8ef0fd07c992.jpg"),
            ),
            const SizedBox(width: 10),
            Text('${message!.message}')
          ],
        ],
      ),
    );
  }
}
