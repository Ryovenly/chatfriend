import 'package:chat_friend/pages/message/photoview/state.dart';
import 'package:get/get.dart';

class PhotoViewToController extends GetxController {
  final PhotoViewState state = PhotoViewState();

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    if (data['url'] != null) {
      state.url.value = data['url']!;
    }
  }
}
