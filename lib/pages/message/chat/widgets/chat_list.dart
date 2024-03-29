import 'package:chat_friend/pages/message/chat/index.dart';
import 'package:chat_friend/pages/message/chat/widgets/chat_left_item.dart';
import 'package:chat_friend/pages/message/chat/widgets/chat_right_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/values/colors.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColors.chatbg,
        padding: EdgeInsets.only(bottom: 50.h),
        child: CustomScrollView(
          reverse: true,
          controller: controller.msgScrolling,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.msgcontentList[index];
                if (controller.user_id == item.uid) {
                  return ChatRightItem(item);
                }
                return ChatLeftItem(item);
              }, childCount: controller.state.msgcontentList.length)),
            )
          ],
        ),
      ),
    );
  }
}
