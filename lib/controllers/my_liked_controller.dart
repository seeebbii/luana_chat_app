import 'package:get/get.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:meta/meta.dart';

class MyLikedController extends GetxController {

  var myLiked = <UserModel>[].obs;


  void loadMyLiked(String uid){
    myLiked.bindStream(Database().getMyLiked(uid));
  }


}