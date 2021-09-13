import 'package:cloud_firestore/cloud_firestore.dart';

class LastMessageModel {

  String? lastMessage;
  String? lastMessageSendBy;
  Timestamp? lastMessageTimeStamp;

  LastMessageModel({
    this.lastMessage, this.lastMessageSendBy, this.lastMessageTimeStamp});

  LastMessageModel.froDoc(DocumentSnapshot doc){
    lastMessage = doc['lastMessage'];
    lastMessageSendBy = doc['lastMessageSendBy'];
    lastMessageTimeStamp = doc['lastMessageTimeStamp'];
  }
}