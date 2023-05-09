import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_friend/common/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/routes/names.dart';

Widget ChatRightItem(Msgcontent item) {
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, right: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 230.w, minHeight: 40.w),
          child: Container(
            margin: EdgeInsets.only(right: 10.w, top: 0.w),
            padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 1, 165, 230),
                    Color.fromARGB(255, 8, 140, 180),
                  ],
                  transform: GradientRotation(90),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.w))),
            child: item.type == "text"
                ? Text("${item.content}")
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 90.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.PhotoView,
                            parameters: {"url": item.content ?? ""});
                      },
                      child: CachedNetworkImage(imageUrl: "${item.content}"),
                    ),
                  ),
          ),
        )
      ],
    ),
  );
}
