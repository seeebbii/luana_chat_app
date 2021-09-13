
import 'package:get/get.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'package:luana_chat_app/models/last_message_model.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:meta/meta.dart';

import 'auth_controller.dart';

class ChatController extends GetxController {

  // var listOfAllChats = <ChatModel>[].obs;
  // var listOfChatRooms = <String>[].obs;

  var lastMessages = <LastMessageModel>[].obs;
  var allMessages = <ChatModel>[].obs;
  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    // listOfChatRooms.bindStream(Database().getChatRoomsId());
    // loadLastMessages(userController.user.value.name);
    super.onInit();
  }


  void loadLastMessages(String myUesername) async{
    lastMessages.bindStream( Database().getLastMessages(myUesername));
  }

  void loadChatMessages(String chatRoomId) async{
    allMessages.bindStream(Database().getChatRoomMessages(chatRoomId));
  }

}