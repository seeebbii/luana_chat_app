import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/views/auth_views/auth_screen.dart';
import 'package:luana_chat_app/views/home_screen.dart';


class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // CHECK IF THE USER IS LOGGED IN ALREADY
    // IF-TRUE ? HOME SCREEN : LOGIN SCREEN

    return Obx(() => Get.put(AuthController()).currentUser.value?.uid != null ? HomeScreen() : const AuthScreen());
  }
}
