import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:luana_chat_app/models/chat_model.dart';
import 'package:luana_chat_app/models/last_message_model.dart';
import 'package:luana_chat_app/models/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  isNewUser(User? _user) async {
    if (_user == null) {
      return false;
    } else {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(_user.uid).get();
      return doc.exists;
    }
  }

  Future<bool> createUserInDatabase(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        'uid': user.id,
        'name': user.name,
        'email': user.email,
        'imageUrl': user.imageUrl,
        'age': user.age,
        'gender': user.gender,
        'height': user.height,
        'status': user.status,
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      print(UserModel.fromDocumentSnapshot(doc).email);
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<List<UserModel>> getAllUsers() {
    return _firestore
        .collection("users")
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserModel> retVal = <UserModel>[];
      query.docs.forEach((element) {
        retVal.add(UserModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future addMessage(String chatRoomId, String messageId,
      Map<String, dynamic> messageInfo) async {
    return _firestore
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfo);
  }

  updateLastMessageSend(
      String chatRoomId, Map<String, dynamic> lastMessageMap) {
    return _firestore
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageMap);
  }

  createChatRoom(
      String chatRoomId, Map<String, dynamic> chatRoomInfoMap) async {
    final snapShot =
        await _firestore.collection("chatrooms").doc(chatRoomId).get();

    if (snapShot.exists) {
      // Chat room exists
      return true;
    } else {
      // Create chat room
      return _firestore
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  Stream<List<UserModel>> getChatRoomsId(String uid) {
    return _firestore.collection("chatrooms").snapshots().map((elem) {
      List<UserModel> retVal = <UserModel>[];
      elem.docs.forEach((element) async {
        if (element['users'][0] == uid) {
          getUser(element['users'][1]).then((value) => retVal.add(value));
        } else {
          getUser(element['users'][0]).then((value) => retVal.add(value));
        }
      });
      return retVal;
    });
  }

  Stream<List<ChatModel>> getChatRoomMessages(String chatRoomId) {
    return _firestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy("timeStamp", descending: false)
        .snapshots()
        .map((event) {
      List<ChatModel> retVal = <ChatModel>[];
      event.docs.forEach((element) {
        retVal.add(ChatModel.fromDoc(element));
      });
      return retVal;
    });
  }

  Stream<List<LastMessageModel>> getLastMessages(String uid) {
    return _firestore.collection("chatrooms").snapshots().map((event) {
      List<LastMessageModel> retVal = <LastMessageModel>[];
      event.docs.forEach((element) {
        if (element['users'][0] == uid || element['users'][1] == uid) {
          retVal.add(LastMessageModel.froDoc(element));
        }
      });
      return retVal;
    });
  }

  Stream<QuerySnapshot> getChatRoomMessagesViaStream(String chatRoomId) {
    return _firestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }
}
