import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/views/auth_views/auth_screen.dart';
import 'package:luana_chat_app/views/settings_screens/account_binding.dart';
import 'package:luana_chat_app/views/settings_screens/feedback.dart';
import 'package:luana_chat_app/views/settings_screens/language_screen.dart';

class SystemSettings extends StatelessWidget {
  SystemSettings({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => AccountBinding());
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Account Binding'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => LanguageScreen());
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Language'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text('About Us'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text('BlockList'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => FeedBack());
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Feedback'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text('Open the Camera'),
                  trailing: CupertinoSwitch(
                    onChanged: (value) {},
                    value: false,
                    activeColor: Colors.purple.shade700,
                    trackColor: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text('DND Mode'),
                  trailing: CupertinoSwitch(
                    onChanged: (value) {},
                    value: true,
                    activeColor: Colors.purple.shade700,
                    trackColor: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                    title: Text('Notice Reminder'),
                    trailing: Text(
                      'Opened',
                      style: TextStyle(color: Colors.white70),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Please open or close the notice reminder in settings.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    authController.logOut();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade700,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
