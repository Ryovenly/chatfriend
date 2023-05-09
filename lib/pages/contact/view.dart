import 'package:chat_friend/common/widgets/app.dart';
import 'package:chat_friend/pages/contact/widgets/contact_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(controller.state.contactList.length);

    AppBar _buildAppBar() {
      return transparentAppBar(
          title: Text(
        "Contact",
        style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
      ));
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: const ContactList(),
    );
  }
}
