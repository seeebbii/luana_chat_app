import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/models/chat_model.dart';

class TextMessage extends StatelessWidget {
  TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatModel? message;

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: message!.sendBy ==  authController.currentUser.value!.uid ? Colors.purple.shade800 : Colors.black,
      ),
      child: Text(
        '${message!.message}',
        style: TextStyle(
          color: message!.sendBy ==  authController.currentUser.value!.uid
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    ));
  }
}
