import 'package:get/get.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/service/database.dart';

class LikedByController extends GetxController {

  var likedBy = <UserModel>[].obs;

  @override
  void onInit() {
    // loadLikedBy();
    super.onInit();
  }


  void loadLikedBy(String uid){
    likedBy.bindStream(Database().getLikedBy(uid));
  }

}