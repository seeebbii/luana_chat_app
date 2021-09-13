import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:random_string/random_string.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final authController = Get.find<AuthController>();

  String messageId = "";

  final messageTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.only(
        top: 5,
        bottom: 8,
        left: 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        child: Row(
          children: [
            RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: Colors.white70)),
                  child: const Icon(Icons.wifi),
                )),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.white70)),
              child: const Icon(Icons.translate),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Type message",
                        ),
                        controller: messageTextEditingController,

                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: Colors.white70)),
                      child: const Icon(Icons.emoji_emotions_outlined),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: Colors.white70)),
                      child: IconButton(icon: const Icon(Icons.send), onPressed: () => sendMessage(true),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  sendMessage(bool sendClicked) {
    if (messageTextEditingController.text != "") {
      String message = messageTextEditingController.text;
      var lastMessageTs = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": authController.loggedInUser.value.name!,
        "timeStamp": lastMessageTs,
      };

      // messageId
      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      Database()
          .addMessage(
          getChatRoomIdByUsernames(
              widget.title!, authController.loggedInUser.value.name!),
          messageId,
          messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageTimeStamp": lastMessageTs,
          "lastMessageSendBy":authController.loggedInUser.value.name!
        };

        Database().updateLastMessageSend(
            getChatRoomIdByUsernames(
                widget.title!, authController.loggedInUser.value.name!),
            lastMessageInfoMap);

        if (sendClicked) {
          messageTextEditingController.clear();
          messageId = "";
        }
      });
    }
  }
}
