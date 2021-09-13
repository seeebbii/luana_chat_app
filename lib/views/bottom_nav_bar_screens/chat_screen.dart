import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luana_chat_app/views/chat_screens/message_screen.dart';
import 'package:luana_chat_app/views/settings_screens/recharge_diamonds.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  String date = DateFormat.Hm().format(DateTime.now());

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
            _allChats()
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => RechargeDiamonds());
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
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Column(
              children: [
                ListTile(
                  title: Text("Exclusive Customer Service"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/customer-service.png"),
                  ),
                  trailing: Text(date,
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ),
                Divider(color: Colors.grey.shade800, thickness: 1)
              ],
            );
          }

          return Column(children: [
            InkWell(
              onTap: () {
                Get.to(() => MessageScreen(
                      title: 'Bela Morena',
                    ));
              },
              child: ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text('Bela Morena')),
                      Text(
                        'Call me and play with me right now hehe!',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      )
                    ]),
                leading: CircleAvatar(
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
        itemCount: 3 + 1,
      ),
    );
  }
}
