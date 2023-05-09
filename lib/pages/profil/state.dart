import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../common/entities/msg.dart';

class ProfilState {
  RxList<QueryDocumentSnapshot<Msg>> msglist =
      <QueryDocumentSnapshot<Msg>>[].obs;
}
