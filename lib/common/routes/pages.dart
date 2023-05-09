import 'package:chat_friend/common/middlewares/middlewares.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../pages/message/chat/index.dart';
import '../../pages/message/photoview/index.dart';
import '../../pages/welcome/index.dart';
import '../../pages/sign_in/index.dart';
import '../../pages/application/index.dart';
import '../../pages/contact/index.dart';

import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBinding(),
        middlewares: [RouteWelcomeMiddleware(priority: 1)]),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
        name: AppRoutes.Application,
        page: () => ApplicationPage(),
        binding: ApplicationBinding(),
        middlewares: [
          RouteAuthMiddleware(priority: 1),
        ]),
    GetPage(
      name: AppRoutes.Application,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.PhotoView,
      page: () => PhotoViewPage(),
      binding: PhotoViewBinding(),
    ),
  ];
}
