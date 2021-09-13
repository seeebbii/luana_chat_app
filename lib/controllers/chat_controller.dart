
import 'package:get/get.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'package:luana_chat_app/models/last_message_model.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:meta/meta.dart';

import 'auth_controller.dart';

class ChatController extends GetxController {

  // var listOfAllChats = <ChatModel>[].obs;
  // var listOfChatRooms = <String>[].obs;

  var lastMessages = <LastMessageModel>[].obs;
  var allMessages = <ChatModel>[].obs;
  final authController = Get.find<AuthController>();


  var myChats = <UserModel>[].obs;



  @override
  void onInit() {
    // listOfChatRooms.bindStream(Database().getChatRoomsId());
    // loadLastMessages(userController.user.value.name);
    // myChatRooms.bindStream(Database().getChatRoomsId()) ;
    // print(myChatRooms.length);
    super.onInit();
  }

  void loadMyChats(String uid){
    myChats.bindStream(Database().getChatRoomsId(uid));
  }


  void loadLastMessages(String uid) async{
    lastMessages.bindStream( Database().getLastMessages(uid));
    loadMyChats(uid);
  }

  void loadChatMessages(String chatRoomId) async{
    allMessages.bindStream(Database().getChatRoomMessages(chatRoomId));
  }

}