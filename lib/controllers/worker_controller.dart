import 'package:get/get.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/service/database.dart';

class WorkerController extends GetxController {


  var allWorkers = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    allWorkers.bindStream(Database().getAllUsers());
  }

}