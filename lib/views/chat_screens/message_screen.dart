import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/controllers/chat_controller.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:luana_chat_app/views/chat_screens/chat_input_field.dart';
import 'package:luana_chat_app/views/chat_screens/message.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final chatController = Get.put(ChatController());
  final authController = Get.find<AuthController>();


  createChatRoom() {
    String chatRoomId = getChatRoomIdByUsernames(
        widget.title!, authController.loggedInUser.value.name!);
    Map<String, dynamic> chatRoomInfoMap = {
      "users": [authController.loggedInUser.value.name!, widget.title!]
    };
    Database().createChatRoom(chatRoomId, chatRoomInfoMap);
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  getAndSetMessages() async {
    chatController.loadChatMessages(getChatRoomIdByUsernames(widget.title!, authController.loggedInUser.value.name!));
  }


  @override
  void initState() {
    // TODO: implement initState
    createChatRoom();
    getAndSetMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            widget.title!,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Obx(() => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: chatController.allMessages.length,
                  itemBuilder: (context, index) =>
                      Message(message: chatController.allMessages[index]),
                ),
              ),
            ),),
            ChatInputField(
              title: widget.title,
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
