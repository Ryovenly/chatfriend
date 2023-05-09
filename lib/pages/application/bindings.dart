import 'package:chat_friend/pages/message/controller.dart';

import '../contact/index.dart';
import '../profil/index.dart';
import 'index.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}
