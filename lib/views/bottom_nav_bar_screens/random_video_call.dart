import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/views/video_call/index.dart';
import 'package:luana_chat_app/views/video_call/match_screen.dart';

class RandomVideoCallScreen extends StatelessWidget {
  RandomVideoCallScreen({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void getOnlineUsers() async {
    final QuerySnapshot result = await _firestore
        .collection('users')
        .where('status', isEqualTo: "Online")
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    authController.onlineUser = documents.first.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Face to Face',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'You will have 10 seconds to decide wether you like each other. After that you can skip that person',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              child: Text(
                'Start',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.to(() => MatchScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
