import 'package:chat_friend/common/entities/entities.dart';
import 'package:chat_friend/common/utils/http.dart';
import 'package:chat_friend/pages/message/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../common/entities/msg.dart';
import '../../common/store/user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageController extends GetxController {
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessageState state = MessageState();
  var listener;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void onReady() {
    super.onReady();
    getUserLocation();
    getFCmToken();
  }

  void onRefresh() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    asyncLoadAllData().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  asyncLoadAllData() async {
    var from_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("From_uid", isEqualTo: token)
        .get();

    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token)
        .get();

    state.msglist.clear();
    if (from_messages.docs.isNotEmpty) {
      state.msglist.assignAll(from_messages.docs);
    }

    if (to_messages.docs.isNotEmpty) {
      state.msglist.assignAll(to_messages.docs);
    }
  }

  getUserLocation() async {
    // try {
    //   final location = await Location().getLocation();
    //   String address = "${location.latitude}, ${location.longitude}";
    //   String url =
    //       "https://maps.googleapis.com/maps/api/geocode/json?adress=${address}&key=API";
    //   var response = await HttpUtil().get(url);
    //   MyLocation location_res = MyLocation.fromJson(response);
    //   if (location_res.status == "OK") {
    //     String? myaddress = location_res.results?.first.formattedAddress;
    //     if (myaddress != null) {
    //       var user_location =
    //           await db.collection("users").where("id", isEqualTo: token).get();
    //       if (user_location.docs.isNotEmpty) {
    //         var doc_id = user_location.docs.first.id;
    //         await db
    //             .collection("users")
    //             .doc(doc_id)
    //             .update({"location": myaddress});
    //       }
    //     }
    //   }
    // } catch (e) {
    //   print("Error $e");
    // }
  }

  getFCmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      var user =
          await db.collection("users").where("id", isEqualTo: token).get();
      if (user.docs.isNotEmpty) {
        var doc_id = user.docs.first.id;
        await db.collection("users").doc(doc_id).update({"fcmtoken": fcmToken});
      }
    }
  }
}
