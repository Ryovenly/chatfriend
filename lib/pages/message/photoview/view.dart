import 'package:chat_friend/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'index.dart';

class PhotoViewPage extends GetView<PhotoViewToController> {
  const PhotoViewPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        child: Container(
          color: AppColors.secondaryElement,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
      title: Text(
        "PhotoView",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child:
            PhotoView(imageProvider: NetworkImage(controller.state.url.value)),
      ),
    );
  }
}
