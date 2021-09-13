import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MessageModel {

  String? sentBy;
  String? text;
  Timestamp? time;
  String? username;
  String imageUrl = '';

  MessageModel({ this.sentBy, this.text , this.time, this.username, required this.imageUrl});

  MessageModel.fromDocumentSnapshot(DocumentSnapshot doc){
    sentBy = doc['userId'];
    text = doc['text'];
    time = doc['createdAt'];
    username = doc['sentBy'];
    imageUrl = doc['imageUrl'];
  }
}