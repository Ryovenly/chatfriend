import 'package:chat_friend/common/values/values.dart';
import 'package:chat_friend/common/widgets/button.dart';

import 'index.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends GetView<SignInController>{
  const SignInPage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context){

    Widget _buildLogo(){
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 76.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(35))
                    ),
                  )
                  ),
                  Positioned(child: Image.asset(
                    "assets/images/ic_launcher.png"
                  ))
                ]),
            )
          ,Container(
            margin: EdgeInsets.only(
              top: 15.h, bottom: 15.h
            ),
            child: Text("Chat Friend",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.thirdElement,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              height: 1
            ),),
            
          )
          ]),
      );
    }

    Widget _buildThirdPartyLogin(){
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 280.h),
        child: Column(children: [
          Text("Se connecter avec les réseaux sociaux",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              )
          ),
          Padding(padding: EdgeInsets.only(
            top: 30.h, left: 50.w, right: 50.w
          ),
          child: btnFlatButtonWidget(onPressed: (){controller.handleSignIn();},
          width: 200.w,
          height: 55.h,
          title: "Se connecter avec Google"),
          )
        ]),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin()
          ]),
      )
    );
  }
}