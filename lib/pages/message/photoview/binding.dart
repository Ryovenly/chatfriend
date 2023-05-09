import 'package:chat_friend/pages/message/photoview/controller.dart';
import 'package:get/get.dart';

class PhotoViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoViewToController>(() => PhotoViewToController());
  }
}
