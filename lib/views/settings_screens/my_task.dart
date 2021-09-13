import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/views/settings_screens/free_video_call.dart';

class MyTask extends StatelessWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Task',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(height: 2, color: Colors.white70),
          InkWell(
            onTap: () {
              Get.to(() => FreeVideoCall());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text(
                  'Get Free Video Call',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          Divider(height: 2, color: Colors.white70),
        ],
      ),
    );
  }
}
