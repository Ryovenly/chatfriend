import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/names.dart';
import '../store/user.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(Duration(seconds: 1),
          () => Get.snackbar("Connexion Expirée", "Veuillez vous reconnectez"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
