import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/controllers/chat_controller.dart';
import 'package:luana_chat_app/controllers/liked_by_controller.dart';
import 'package:luana_chat_app/controllers/my_liked_controller.dart';
import 'package:luana_chat_app/views/chat_screens/message_screen.dart';
import 'package:luana_chat_app/views/chat_screens/who_liked_my_profile.dart';
import 'package:luana_chat_app/views/settings_screens/recharge_diamonds.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.find<ChatController>();
  final authController = Get.find<AuthController>();
  final likedBy = Get.find<LikedByController>();
  final myLiked = Get.find<MyLikedController>();

  String date = DateFormat.Hm().format(DateTime.now());

  Future<void> _refreshList() async {
    chatController.loadMyChats(authController.currentUser.value!.uid);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {});

  }

  @override
  void initState() {
    likedBy.loadLikedBy(authController.currentUser.value!.uid);
    myLiked.loadMyLiked(authController.currentUser.value!.uid);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/contact.png"),
              ),
              title: Text('Call History'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/eyes.png"),
              ),
              title: Text('Who viewed my profile'),
            ),
             ListTile(
              onTap: (){
                Get.to(() => const WhoLikedMyProfile());
              },
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/button-Heart.png"),
              ),
              title: const Text('Who liked my profile'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/notifications.png"),
              ),
              title: Text('Messages'),
            ),
            Divider(
              color: Colors.grey.shade800,
              thickness: 4,
            ),
            ListTile(
              title: const Text("Exclusive Customer Service"),
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage:
                AssetImage("assets/images/customer-service.png"),
              ),
              trailing: Text(date,
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
            Divider(color: Colors.grey.shade800, thickness: 1),
            _allChats()
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => const RechargeDiamonds());
        },
        child: Image.asset(
          'assets/images/Recharge.png',
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  Widget _allChats() {
    return Expanded(
      child: GetX<ChatController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: _refreshList,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => MessageScreen(
                        user: controller.myChats[index],
                      ))!.then((value) {setState(() {

                      });});
                    },
                    child: ListTile(
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Text('${controller.myChats[index].email}')),
                            Text(
                              '${controller.lastMessages[index].lastMessage}',
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            )
                          ]),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/3b/ff/bd/3bffbd11a40e99fc595a8ef0fd07c992.jpg"),
                      ),
                      trailing: Text(date,
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ),
                  ),
                  Divider(color: Colors.grey.shade800, thickness: 1)
                ]);
              },
              itemCount: controller.myChats.length ,
            ),
          );
        }
      ),
    );
  }
}
