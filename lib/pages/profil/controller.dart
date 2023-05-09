import 'package:chat_friend/common/routes/names.dart';
import 'package:chat_friend/pages/message/state.dart';
import 'package:chat_friend/pages/profil/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';

class ProfilController extends GetxController {
  ProfilController();
  final ProfilState state = ProfilState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly'
  ]);
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  Future<void> onLogout() async {
    UserStore.to.onLogout();
    await _googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
