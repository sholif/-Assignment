
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utills/app_images/app_images.dart';
import '../../controller/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = '/SplashScreen';

  SplashScreen({super.key});
  final SplashController splashController = Get.find<SplashController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Full screen background image


          /// app icon image
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: Image.asset(
                AppImages.appIcon,
                height: 120.h,
                width: 120.w,
              ),
            ),
          )

        ],
      ),
    );
  }
}
