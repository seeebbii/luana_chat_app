import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/controllers/liked_by_controller.dart';

class WhoLikedMyProfile extends StatefulWidget {
  const WhoLikedMyProfile({Key? key}) : super(key: key);

  @override
  State<WhoLikedMyProfile> createState() => _WhoLikedMyProfileState();
}

class _WhoLikedMyProfileState extends State<WhoLikedMyProfile> {
  final likedByController = Get.find<LikedByController>();
  final authController = Get.find<AuthController>();

  Future<void> _refreshList() async {
    likedByController.loadLikedBy(authController.currentUser.value!.uid);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Liked By",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: GetX<LikedByController>(
        builder: (ctr) {
          return RefreshIndicator(
            onRefresh: _refreshList,
            child: ListView.builder(itemCount: ctr.likedBy.length, itemBuilder: (_, index){
              return ListTile(
                leading:  CircleAvatar(
                  backgroundImage: NetworkImage('${ctr.likedBy[index].imageUrl}'),
                ),
                title: Text('${ctr.likedBy[index].email}'),
              );
            }),
          );
        }
      ),
    );
  }
}
