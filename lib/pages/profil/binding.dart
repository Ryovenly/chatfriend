import 'index.dart';
import 'package:get/get.dart';

class ProfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}
