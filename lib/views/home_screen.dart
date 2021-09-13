import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/controllers/chat_controller.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:luana_chat_app/utils/color_const.dart';
import 'package:luana_chat_app/views/bottom_nav_bar_screens/profile_screen.dart';
import 'package:luana_chat_app/views/bottom_nav_bar_screens/random_video_call.dart';
import 'package:luana_chat_app/views/bottom_nav_bar_screens/main_screen.dart';

import 'bottom_nav_bar_screens/chat_screen.dart';
import 'video_tab_screens/video_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final _authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final chatController = Get.put(ChatController());
  @override
  void initState() {
    if (_authController.currentUser.value?.uid != null) {
      Database().getUser(_authController.currentUser.value!.uid).then((value) {
        _authController.loggedInUser.value = value;
      });
      chatController.loadMyChats(_authController.currentUser.value!.uid);
      chatController.loadLastMessages(_authController.currentUser.value!.uid);
    }
    WidgetsBinding.instance!.addObserver(this);
    setStatus('Online');
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setStatus('Online');
    } else {
      setStatus('Offline');
    }
  }

  void setStatus(String status) async {
    await _firestore
        .collection('users')
        .doc(_authController.currentUser.value!.uid)
        .update({
      'status': status,
    });
  }

  int _selectedPage = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> myPages = [
    MainScreen(),
    VideoScreen(),
    RandomVideoCallScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: myPages,
          index: _selectedPage,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              _onItemTapped(2);
            },
            child: Image.asset("assets/images/button-Heart.png")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _selectedPage == 0
                  ? LinearGradientMask(
                      child: const Icon(
                      Icons.home,
                      size: 35,
                      color: Colors.white,
                    ))
                  : const Icon(Icons.home, size: 35, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedPage == 1
                  ? LinearGradientMask(
                      child: const Icon(
                      Icons.play_circle_outline,
                      size: 35,
                      color: Colors.white,
                    ))
                  : const Icon(Icons.play_circle_outline,
                      size: 35, color: Colors.white),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedPage == 3
                  ? LinearGradientMask(
                      child: const Icon(
                      Icons.message_outlined,
                      size: 35,
                      color: Colors.white,
                    ))
                  : const Icon(Icons.message_outlined,
                      size: 35, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedPage == 4
                  ? LinearGradientMask(
                      child: const Icon(
                      Icons.assignment_ind_outlined,
                      size: 35,
                      color: Colors.white,
                    ))
                  : const Icon(Icons.assignment_ind_outlined,
                      size: 35, color: Colors.white),
              label: '',
            ),
          ],
          currentIndex: _selectedPage,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
