import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/views/settings_screens/beauty_settings.dart';
import 'package:luana_chat_app/views/settings_screens/my_task.dart';
import 'package:luana_chat_app/views/settings_screens/my_wallet_screen.dart';
import 'package:luana_chat_app/views/settings_screens/personal_information.dart';
import 'package:luana_chat_app/views/settings_screens/recharge_diamonds.dart';
import 'package:luana_chat_app/views/settings_screens/system_settings.dart';
import 'package:luana_chat_app/views/settings_screens/user_level_screen.dart';
import 'package:luana_chat_app/views/settings_screens/vip_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple.shade700,
          centerTitle: true,
          title: const Text(
            'My',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.purple.shade700,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 90),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text('0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('Followed',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ],
                        ),
                        Column(
                          children: const [
                            Text('0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('Fans',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => UserLevelScreen());
                          },
                          child: Column(
                            children: const [
                              Text('1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text('Level',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => VipScreen());
                    },
                    child: Container(
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/Vip.png"),
                        ),
                        title: Text('VIP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => RechargeDiamonds());
                    },
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Diamond.png"),
                        ),
                        title: Text('Recharge Diamonds',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => MyWalletScreen());
                    },
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/wallet.png"),
                        ),
                        title: Text('My Wallet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => MyTask());
                    },
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/task.png"),
                        ),
                        title: Text('My Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => BeautySettings());
                    },
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/beauty-setting.png"),
                        ),
                        title: Text('Beauty Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => SystemSettings()),
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Settings-icon.png"),
                        ),
                        title: Text('System Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => PersonalInfromation());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Obx(
                        () => CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                _authController.loggedInUser.value.imageUrl ==
                                        null
                                    ? NetworkImage('')
                                    : NetworkImage(_authController
                                        .loggedInUser.value.imageUrl!)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => PersonalInfromation());
                          },
                          child: Obx(() => Text(
                                '${_authController.loggedInUser.value.name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            color: Colors.pink,
                            child: Text('no'),
                          ),
                        ),
                        Obx(
                          () => Text(
                              '${_authController.loggedInUser.value.id?.replaceRange(7, _authController.loggedInUser.value.id!.length, "")}'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => PersonalInfromation());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 15, left: 120),
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ],
              ),
            )
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
}
